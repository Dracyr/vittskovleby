class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false, limit: 255
      t.string :content, null: false
      t.timestamps
    end
  end
end
