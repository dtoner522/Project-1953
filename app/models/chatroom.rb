class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :book

  def get_other_user(current_user)
    sender == current_user ? recipient : sender
  end

  # def last_message_time(chatroom)
  #   sent = chatroom.messages.last.created_at
  #   now = DateTime.new
  #   now - sent
  # end


  def self.existing(recipient_user, current_user, book)
    where(recipient: recipient_user, sender: current_user, book: book)
  end
end
