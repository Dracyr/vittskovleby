class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name, null: false
    end

    create_table :role_memberships do |t|
      t.references :role
      t.references :user
      t.timestamps
    end
  end
end
