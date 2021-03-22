class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def chat_message_time
    created_at.strftime("%a %b %e at %l:%M%p")
  end
end

# TODO: sent time

# if chatroom.messages.last.created_at

# if chat sent day is today, show the hour
# else, show the day
# group them by day
