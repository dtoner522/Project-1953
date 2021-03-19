class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.includes(:book, :sender, :recipient, :messages).find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.create(
      recipient_id: params[:chatroom][:recipient_id],
      sender_id: current_user.id, book_id: params[:chatroom][:book_id]
    )

    redirect_to chatroom_path(@chatroom)
  end
end
