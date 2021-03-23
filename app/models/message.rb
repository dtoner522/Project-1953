class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def chat_message_time
    if created_at.today?
      created_at.strftime("%l:%M%p")
    else
      created_at.strftime("%a %b %e at %l:%M%p")
    end
  end
end
