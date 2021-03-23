class WishlistBooksController < ApplicationController

  def destroy
    @wishlist_book = WishlistBook.find(params[:id])
    @wishlist_book.destroy
    flash[:alert] = "Removed from your wishlist"
    redirect_back(fallback_location: root_path)
  end

  def create
    @wishlist_book = WishlistBook.new
    @wishlist_book.book_id = params[:book_id]
    @wishlist_book.wishlist_id = params[:wishlist_id]
    if @wishlist_book.save
      flash.alert = "Added to your wishlist !"
      redirect_back(fallback_location: root_path)
    end
  end

  private
end




