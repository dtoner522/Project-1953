class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :uikit, :results ]

  def home
  end

  def uikit
  end

  def results
  end

  # TODO: PRIVATE

  def messages
    @user = current_user
    @chatrooms = @user.chatrooms
  end
end
