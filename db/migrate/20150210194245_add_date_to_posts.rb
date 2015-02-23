class AddDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :date, :datetime, null: false
  end
end
