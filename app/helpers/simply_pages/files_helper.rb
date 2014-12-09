module SimplyPages
  module FilesHelper

    def array_to_file_json(ary)
      ary.map do |item|
        json_attr = {}
        json_attr['key'] = item.id
        json_attr['folder'] = item.folder?
        json_attr['lazy'] = true if item.folder?
        json_attr['href'] = case item
                              when File
                                edit_file_path(item.id)
                              #when FileGroup
                              #  edit_file_group_path(item.id)
                              else
                                ''
                            end
        json_attr['title'] = if item.is_a?(SimplyPages::File)
          content_tag(:span,
                      content_tag(:img, '', src: item.media.url(:thumb), class: 'fullsize', alt: nil) + item.title,
                      class: 'image-data',
                      data: { url: item.media.url(:original),
                              url2: item.media.url(:resized),
                              caption: item.caption,
                              type: 'image'
                      }
          )
        else
          item.title
        end
        json_attr
      end.to_json
    end

    def fancytree_grouped_hash(groups, items, branch_id=nil, top_node=true, new_link=true, lazy=true, &labelling)
      # use the containing group to determine model type if this is empty
      model_group = groups[branch_id]
      model_group ||= groups[groups.select{|k,g| g.include?(branch_id)}.keys.first]
      item_model = (model_group || groups).first.grouped_type.underscore.split('/').last
      labelling = ->(item) { fancytree_label_for(item) } unless block_given?
      collection = (groups[branch_id].nil? ? [] : groups[branch_id]).map do |group|
        child_groups = groups[group.id] || []
        page_hash = { title: group.label, key: group.id, folder: true, href: method("edit_admin_cms_site_group_path".sub('site_site','site')).call({site_id: @site.id, id: group.id, format: :js}) }
        if lazy && !top_node
          if !(child_groups.empty? && (items[group.id] || []).empty?)
            # add lazy flag
            page_hash.merge!({lazy: true})
          end
        else
          # add child groups/folders
          child_contents = []
          unless child_groups.empty?
            child_contents = (fancytree_grouped_hash(groups, items, group.id, false, false, lazy, &labelling))
          end
          child_items = items[group.id] || []
          unless child_items.empty?
            child_items.each do |item|
              child_contents << { title: labelling.call(item), key: item.id, href: method("edit_admin_cms_site_#{item_model}_path".sub('site_site','site')).call({site_id: @site.id, id: item.id, format: :js})}
            end
          end
          page_hash.merge!({folder: true, children: child_contents})
        end
        if top_node
          # just return the children, skip the root node
          child_contents
        else
          # page and collection as children
          page_hash
        end
      end
      if top_node
        if new_link
          # add a link to add an item
          collection = collection.first # remove array nesting
          grouped_type = groups[branch_id].first.grouped_type.underscore.split('/').last
          html = link_to content_tag(:i, '', :class => 'icon-plus').concat(t(:new_link, :scope => 'admin.cms.groups')), eval("admin_cms_new_#{grouped_type}_group_path(site_id: #{@site.id})")
          collection << { title: html }
        end
      elsif !defined?(page_hash) && collection.empty?
        # this is a leaf node, we just return the child_items
        child_items = items[branch_id] || []
        unless child_items.empty?
          child_items.each do |item|
            collection << { title: labelling.call(item), key: item.id, href: method("edit_admin_cms_site_#{item_model}_path".sub('site_site','site')).call({site_id: @site.id, id: item.id, format: :js})}
          end
        end
      end
      collection
    end

    # simplify standard calls for grouped items
    def fancytree_group_select_hash(groups, items, labelling)
      fancytree_grouped_hash(groups, items, nil, true, true, &labelling)
    end

    def fancytree_label_for(item)
      case item
        when Cms::File # need not be an image!
          item.is_image? ? image_tag(item.file.url(:mini), class: :fullsize, alt: nil) + ' ' + item.label : item.label
        else
          item.label
      end
    end

  end
end
