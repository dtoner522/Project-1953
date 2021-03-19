class LibraryBooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @library_books = LibraryBook.all 
    @library_books = LibraryBook.select {|lb| lb.library.user.location.downcase == params[:query].downcase} if params[:query].present?

  
    @library_books = @library_books.joins(:book).where("books.title ILIKE ? ", "%#{params[:title]}%") if params[:title].present?
    @library_books = @library_books.joins(:book).where("books.language ILIKE ? ", params[:language]) if params[:language].present?
    @library_books = @library_books.joins(:book).where("books.genre ILIKE ? ", params[:genre]) if params[:genre].present?
  end
  
  def create
    @book = Book.new()
    @library_book = LibraryBook.new(book: @book, library_id: current_user.library)
  end

  def show
    @lib_book = LibraryBook.find(params[:id])
  end
end





# def self.search(search)
#   if search 
#     books = Book.all
#     books = book.where(language: search[:":language"][","])
#     return books
#   else
#     Book.all
#   end
# end

# @books = Book.select {|b| b.language == params[:query].downcase} 
# @books = Book.search(params[:book])

