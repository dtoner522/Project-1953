require 'open-uri'

class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    thumbnail_url = params[:book][:thumbnail_url]
    thumbnail = URI.open(thumbnail_url)
    @book.photo.attach(io: thumbnail, filename: 'thumbnail.png', content_type: 'image/png')

    if params["commit"].include?("ibrary")
      create_lib_book
    elsif params["commit"].include?("ishlist")
      create_wish_book
    end
  end

  def create_lib_book
    if @book.save
      LibraryBook.create(
        book_id: @book.id,
        library_id: current_user.libraries.first.id,
        condition: params['condition']
        )
      redirect_to user_path(current_user), notice: "Book added to your library!"
    else
      render :new
    end
  end

  def create_wish_book
    if @book.save
      WishlistBook.create(
        book_id: @book.id,
        wishlist_id: current_user.wishlists.first.id,
        )
      redirect_to user_path(current_user), notice: "Book added to your wishlist!"
    else
      render :new
    end
  end


  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :year,
      :isbn,
      :genre,
      :language,
      :description,
      :page_count,
      :thumbnail_url
    )
  end
end
