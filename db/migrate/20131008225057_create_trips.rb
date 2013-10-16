class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destination

      t.integer :user_id
      t.integer :username
      t.integer :seat_number

      t.timestamps
    end
  end
end
