class AddParentToPages < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.belongs_to :parent
    end
  end
end
