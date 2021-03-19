class ChangeColumnTypeInBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :year, :string
  end
end
