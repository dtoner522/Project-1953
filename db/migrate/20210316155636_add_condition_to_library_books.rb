class AddConditionToLibraryBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :library_books, :condition, :string
  end
end
