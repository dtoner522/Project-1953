class Chatroom < ApplicationRecord
  has_many :messages

  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"

  def get_other_user(current_user)
    self.sender == current_user ? self.recipient : self.sender
  end
end
