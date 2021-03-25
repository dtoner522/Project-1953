class LibraryBook < ApplicationRecord
  belongs_to :library
  belongs_to :book

  has_many :chatrooms, dependent: :destroy
  has_many :swap_requests, dependent: :destroy
  has_many :matches, dependent: :destroy

  after_create :check_match

  def is_favoritable_to(user)
    (self.library.user != user) || !(user.libraries.first.library_books.any? {|lb| lb.book.title == self.book.title})
  end

  def is_in_wishlist(lib_book, user)
    user.wishlists.first.wishlist_books.find { |wbbook| wbbook.book.id == lib_book.book.id }
    # we have an instance of a book -> find the first wishlist_book from that user with that Book
  end

  private

  def check_match
    WishlistBook.all.each do |wish_book|
      if self.book.id == wish_book.book.id
        Match.create(library_book_id: self.id, wishlist_book_id: wish_book.id, status: "simple-match")
      end
    end
  end

end
