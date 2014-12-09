class CreateSimplyPagesFiles < ActiveRecord::Migration
  def change
    create_table :simply_pages_file_groups do |t|
      t.string :title
      t.integer :parent_id, null: true, index: true
      t.integer :position
      t.integer :children_count, null: false, default: 0
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
    end
    create_table :simply_pages_files do |t|
      t.string :title
      t.string :caption
      t.string :media_file_name
      t.string :media_content_type
      t.integer :media_file_size
      t.integer :file_group_id
      t.timestamps
    end
  end
end
