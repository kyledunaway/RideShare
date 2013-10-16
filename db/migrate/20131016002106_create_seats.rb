class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :trip_id
      t.integer :user_id
      t.string  :username

      t.timestamps
    end
  end
end
