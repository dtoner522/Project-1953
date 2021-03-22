class RenameColumnOnChatrooms < ActiveRecord::Migration[6.0]
  def change
    rename_column :chatrooms, :book_id, :library_book_id
  end
end
