class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destination
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.integer :user_id
      t.integer :username

      t.timestamps
    end
  end
end
