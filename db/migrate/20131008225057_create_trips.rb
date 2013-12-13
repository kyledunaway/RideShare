class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destination

      t.integer :user_id
      t.integer :username
      t.integer :seat_number
      t.integer :price
      t.date    :start_date
      t.text  :comments

      t.timestamps
    end
  end
end
