class Library < ApplicationRecord
  belongs_to :user
  has_many :library_books, dependent: :destroy

  has_many :books, through: :library_books
end
