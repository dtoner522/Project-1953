class RenameGeolocationToLocation < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :geolocation, :location
  end
end
