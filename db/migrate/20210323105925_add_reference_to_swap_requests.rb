class AddReferenceToSwapRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :swap_requests, :chatroom, foreign_key: true
  end
end
