class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title, null: false
    end
  end
end
