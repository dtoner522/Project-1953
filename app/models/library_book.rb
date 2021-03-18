class LibraryBook < ApplicationRecord
  belongs_to :library
  belongs_to :book

  has_many :swap_requests

end