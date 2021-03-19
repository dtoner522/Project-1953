class LibraryBook < ApplicationRecord
  belongs_to :library
  belongs_to :book

  has_many :swap_requests

  def is_favoritable_to(user)
    (self.library.user != user) || !(user.libraries.first.library_books.any? {|lb| lb.book.title == self.book.title})
  end

end
