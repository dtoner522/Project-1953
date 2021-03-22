class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishlist_books

  has_many :books, through: :wishlist_books
end
