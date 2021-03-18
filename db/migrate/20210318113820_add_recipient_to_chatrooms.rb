class AddRecipientToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :recipient
    add_reference :chatrooms, :sender
  end
end
