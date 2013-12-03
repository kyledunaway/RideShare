class AddAddersToSeats < ActiveRecord::Migration
  def change
    add_column :seats, :pending, :boolean
    add_column :seats, :accepted, :boolean
  end
end
