class RemoveParentFromPage < ActiveRecord::Migration
  def change
    remove_column :pages, :parent_id, :integer
  end
end
