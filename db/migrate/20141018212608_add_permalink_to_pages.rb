class AddPermalinkToPages < ActiveRecord::Migration
  def change
    add_column :pages, :permalink, :string, null: false
  end
end
