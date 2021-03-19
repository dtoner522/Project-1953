class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def chat_message_time
    created_at.strftime("%a %b %e at %l:%M%p")
  end
end
