class AddFieldsToMenus < ActiveRecord::Migration
  def change
    remove_column :menus, :title, :string
    change_table :menus do |t|
      t.belongs_to :parent
      t.belongs_to :page

      t.integer :menu_type, null: false
      t.integer :position
      t.string  :link
      t.string  :title

      t.timestamps
    end
  end
end
