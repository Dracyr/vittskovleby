class ChangePostContentTypeToText < ActiveRecord::Migration
  def up
    change_column :pages, :content, :text, null: false
  end
  def down
    # Text longer than 255 chars truncated.
    change_column :pages, :content, :string, null: false
  end
end
