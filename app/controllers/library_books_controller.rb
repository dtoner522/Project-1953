class LibraryBooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @library_books = LibraryBook.all
  end

  def show
  end

end
