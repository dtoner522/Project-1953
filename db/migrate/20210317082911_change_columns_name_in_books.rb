class ChangeColumnsNameInBooks < ActiveRecord::Migration[6.0]
  def change
   rename_column :books, :ISBN, :isbn
   rename_column :books, :pageCount, :page_count
   rename_column :books, :thumbnailUrl, :thumbnail_url
  end
end
