class CreateTableWishlistBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlist_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :wishlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
