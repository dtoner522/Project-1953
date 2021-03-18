class LibraryBooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @library_books = LibraryBook.select {|lb| lb.library.user.location.downcase == params[:query].downcase} 
    else
      @library_books = LibraryBook.all
    end
  end
  
  def create
    @book = Book.new()
    @library_book = LibraryBook.new(book: @book, library_id: current_user.library)
  end

  def show
    @lib_book = LibraryBook.find(params[:id])
  end
end
