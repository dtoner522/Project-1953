class LibraryBooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @library_books = LibraryBook.where(status: 'available')

    @library_books = @library_books.select { |lb| lb.library.user.location.downcase == params[:query].downcase } if params[:query].present?
    @params_coordinates = Geocoder.coordinates(params[:query]) if params[:query].present?
    @library_books = params[:query].present? ? User.near(params[:query], 15).map{|user| user.library_books}.flatten : @library_books

    @library_books = @library_books.joins(:book).where("books.title ILIKE ? ", "%#{params[:title]}%") if params[:title].present?
    @library_books = @library_books.joins(:book).where("books.language ILIKE ? ", params[:language]) if params[:language].present?
    @library_books = @library_books.joins(:book).where("books.genre ILIKE ? ", params[:genre]) if params[:genre].present?
    # raise
    if current_user
      wishlist_instances
    end
  end

  def destroy
    @library_book = LibraryBook.find(params[:id])
    @library_book.destroy

    redirect_to user_path(current_user), notice: "Book deleted from your library"
  end

  def show
    @lib_book = LibraryBook.find(params[:id])
    @book = @lib_book.book

    @chatroom = Chatroom.new
    if current_user
      wishlist_instances
    end
  end

  def mark_as_swapped
    @library_book = LibraryBook.find(params[:id])
    @library_book.status = 'swapped'
    @library_book.save

    redirect_to library_book_path(@library_book)
  end

  private

  def wishlist_instances
    @wishlist_books = current_user.wishlists.first.books
    @wishlist_wishlist_books = current_user.wishlists.first.wishlist_books
    @wishlist_book = @wishlist_books.include?(@book) ? @wishlist_wishlist_books.find { |wish_book| wish_book.book == @book } : WishlistBook.new
  end
end
