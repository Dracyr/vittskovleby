class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :menus, :parent_id
    add_index :menus, :page_id
  end
end
