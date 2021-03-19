class LibraryBooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @library_books = LibraryBook.all 
    @library_books = LibraryBook.select {|lb| lb.library.user.location.downcase == params[:query].downcase} if params[:query].present?
    @library_books = @library_books.joins(:book).where("books.title ILIKE ? ", "%#{params[:title]}%") if params[:title].present?
    @library_books = @library_books.joins(:book).where("books.language ILIKE ? ", params[:language]) if params[:language].present?
    @library_books = @library_books.joins(:book).where("books.genre ILIKE ? ", params[:genre]) if params[:genre].present?
  end

  def show
    @lib_book = LibraryBook.find(params[:id])
    @chatroom = Chatroom.new
  end
end
