class LibraryBooksController < ApplicationController
  def create
    @book = Book.new()
    @library_book = LibraryBook.new(book: @book, library_id: current_user.library)

  end

  def show
    @lib_book = LibraryBook.find(params[:id])
  end
end
