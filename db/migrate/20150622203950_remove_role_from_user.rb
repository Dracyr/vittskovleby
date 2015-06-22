class RemoveRoleFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :role, :integer, null: false, default: 0
  end
end
