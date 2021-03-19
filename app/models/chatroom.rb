class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :book
  # belongs_to :library_book


  def get_other_user(current_user)
    sender == current_user ? recipient : sender
  end

  def self.existing(recipient_user, current_user, book)
    where(recipient: recipient_user, sender: current_user, book: book)
  end
end
