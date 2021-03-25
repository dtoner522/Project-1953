class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :status
      t.references :library_book, null: false, foreign_key: true
      t.references :wishlist_book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
