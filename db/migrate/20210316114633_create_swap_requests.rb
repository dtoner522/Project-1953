class CreateSwapRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :swap_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :library_book, null: false, foreign_key: true
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
