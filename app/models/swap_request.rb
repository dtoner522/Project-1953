class SwapRequest < ApplicationRecord
  belongs_to :user
  belongs_to :library_book
  belongs_to :chatroom
end
