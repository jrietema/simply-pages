class AddPageDepth < ActiveRecord::Migration
  def change
    change_table :simply_pages_pages do |t|
      t.integer :depth, default: 0
    end
    reversible do |dir|
      dir.up do
        say_with_time 'Updating awesome_nested_set attributes for simply_pages_pages' do
          SimplyPages::Page.find_each do |p|
            begin
              p.save
            rescue
            end
          end
        end
      end
    end
  end
end
