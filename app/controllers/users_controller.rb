class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @library_books = @user.libraries.first.library_books.reverse
    @wishlist_books = @user.wishlists.first.wishlist_books.reverse
    @wishlist_book = WishlistBook.new
  end
end
