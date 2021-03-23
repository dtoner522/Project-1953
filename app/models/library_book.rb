class LibraryBook < ApplicationRecord
  belongs_to :library
  belongs_to :book

  has_many :chatrooms, dependent: :destroy
  has_many :swap_requests, dependent: :destroy

  def is_favoritable_to(user)
    (self.library.user != user) || !(user.libraries.first.library_books.any? {|lb| lb.book.title == self.book.title})
  end

  def is_in_wishlist(lib_book, user)
    user.wishlists.first.wishlist_books.find { |wbbook| wbbook.book.id == lib_book.book.id }
    # we have an instance of a book -> find the first wishlist_book from that user with that Book
  end
end
