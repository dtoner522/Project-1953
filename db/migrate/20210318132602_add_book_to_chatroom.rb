class AddBookToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :book
  end
end
