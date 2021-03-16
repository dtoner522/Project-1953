class AddDescriptionToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :description, :string
    add_column :books, :author, :string
    add_column :books, :pageCount, :string
    add_column :books, :thumbnailUrl, :string
  end
end
