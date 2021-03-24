class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @library_books = @user.libraries.first.library_books
    @wishlist_books = @user.wishlists.first.wishlist_books
    @wishlist_book = Wishlist.new
  end
end
