class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :uikit, :results ]

  def home
    @location = current_user ? current_user.location : "Type city..."
  end

  def uikit; end

  def error; end

  def messages
    @user = current_user
    @chatrooms = @user.chatrooms.reject { |chat| chat.messages.empty? }
    @chatrooms = @chatrooms.sort_by { |chat| - chat.messages.last.created_at.to_i }
  end

  def notifications
    @user = current_user
    @notifications = @user.chatrooms

    @library_books = @user.libraries.first.library_books.all
  end
end
