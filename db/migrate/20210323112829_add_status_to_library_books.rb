class AddStatusToLibraryBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :library_books, :status, :string, default: 'available'
  end
end
