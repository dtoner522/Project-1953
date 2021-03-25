class WishlistBook < ApplicationRecord
  belongs_to :wishlist
  belongs_to :book
  has_many :matches, dependent: :destroy
  
  after_create :check_match
  

  private

  def check_match
    LibraryBook.all.each do |lib_book|
      if self.book.id == lib_book.book.id
        Match.create(library_book_id: lib_book.id, wishlist_book_id: self.id, status: "simple-match")
      end
    end
  end

end
