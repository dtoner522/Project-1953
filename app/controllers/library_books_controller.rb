class LibraryBooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @library_books = LibraryBook.all
  end
  
  def create
    @book = Book.new()
    @library_book = LibraryBook.new(book: @book, library_id: current_user.library)

  end

  def show
    @lib_book = LibraryBook.find(params[:id])
  end
end
