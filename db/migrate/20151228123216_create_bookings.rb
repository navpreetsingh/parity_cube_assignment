class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :room, index: true, foreign_key: true
      t.references :room_type, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.date :check_in
      t.date :check_out

      t.timestamps null: false
    end
  end
end
