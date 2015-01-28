class AddPagesNavigationType < ActiveRecord::Migration
  def change
    change_table :simply_pages_pages do |t|
      t.integer :navigation_type, default: 0
    end
  end
end
