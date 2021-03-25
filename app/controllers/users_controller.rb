class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @library_books = @user.libraries.first.library_books.where(status: 'available').reverse
    @wishlist_books = @user.wishlists.first.wishlist_books.reverse
    @wishlist_book = WishlistBook.new

    @swaps = swaps_counter
  end

  private

  def swaps_counter
    count = 0
    count += @user.swap_requests.where(status: 'accepted').count

    accepted = []
    @user.library_books.select do |library_book|
      library_book.swap_requests.each do |sr|
        accepted << sr if sr.status == 'accepted'
      end
    end

    count + accepted.length
  end
end
