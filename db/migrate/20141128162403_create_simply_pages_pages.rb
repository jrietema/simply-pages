class CreateSimplyPagesPages < ActiveRecord::Migration
  def change
    create_table :simply_pages_pages do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.integer :parent_id, null: true, index: true
      t.integer :position
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.integer :children_count, null: false, default: 0

      t.timestamps
    end
  end
end
