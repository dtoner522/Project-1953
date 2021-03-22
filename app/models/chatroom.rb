class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :library_book

  def get_other_user(current_user)
    sender == current_user ? recipient : sender
  end

  def self.existing(recipient_user, current_user, library_book)
    where(recipient: recipient_user, sender: current_user, library_book: library_book)
  end

  def unread_messages(user = nil)
    if user.nil?
      messages.select { |message| message.read == false }.count
    else
      messages.where(user: get_other_user(user)).select { |message| message.read == false }.count
    end
  end

  def self.chat_notifications?
    Chatroom.select { |chatroom| chatroom.chat_notifications? }.count.positive?
  end
end
