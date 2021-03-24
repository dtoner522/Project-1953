class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.includes(:library_book, :sender, :recipient, :messages).find(params[:id])
    @message = Message.new

    mark_messages_as_read
  end

  def create
    @chatroom = Chatroom.create(
      recipient_id: params[:chatroom][:recipient_id],
      sender_id: current_user.id, library_book_id: params[:chatroom][:library_book_id]
    )

    create_swap_request
  end

  private

  def mark_messages_as_read
    @messages = @chatroom.messages.where(user: @chatroom.get_other_user(current_user))
    @messages.each do |message|
      message.update(read: true)
    end
  end

  def create_swap_request
    @swap_requests = SwapRequest.create(user_id: current_user.id,
                                        library_book_id: params[:chatroom][:library_book_id],
                                        chatroom_id: @chatroom.id,
                                        status: "pending"
                                      )
    redirect_to chatroom_path(@chatroom)
  end
end
