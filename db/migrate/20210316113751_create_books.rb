class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :ISBN
      t.string :title
      t.integer :year
      t.string :genre
      t.string :language

      t.timestamps
    end
  end
end
