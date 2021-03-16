class SwapRequest < ApplicationRecord
  belongs_to :user
  belongs_to :library_book
end
