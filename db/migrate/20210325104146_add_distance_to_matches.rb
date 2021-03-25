class AddDistanceToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :distance, :string
  end
end
