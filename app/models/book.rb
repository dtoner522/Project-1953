class Book < ApplicationRecord
  has_one_attached :photo
  has_many :chatrooms
end
