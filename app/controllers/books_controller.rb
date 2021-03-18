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
    if @book.save
      LibraryBook.create(
        book_id: @book.id,
        library_id: current_user.libraries.first.id,
        condition: params['condition']
        )
      redirect_to user_path(current_user)
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
