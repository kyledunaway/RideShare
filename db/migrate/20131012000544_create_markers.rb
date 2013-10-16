class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.integer :trip_id
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
