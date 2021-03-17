class LibraryBooksController < ApplicationController
  def show
    @lib_book = LibraryBook.find(params[:id])
  end
end
