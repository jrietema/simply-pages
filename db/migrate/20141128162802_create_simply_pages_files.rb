class CreateSimplyPagesFiles < ActiveRecord::Migration
  def change
    create_table :simply_pages_files do |t|
      t.string :title
      t.string :media_file_name
      t.string :media_content_type
      t.integer :media_file_size

      t.timestamps
    end
  end
end
