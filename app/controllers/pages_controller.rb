class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :uikit, :results ]

  def home
  end

  def uikit
  end

  def results
  end

  def messages
    @user = current_user
    @chatrooms = @user.chatrooms.reject { |chat| chat.messages.empty? }
  end

  def notifications
  end
end
