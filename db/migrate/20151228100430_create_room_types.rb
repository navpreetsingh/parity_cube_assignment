class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.string :name
      t.string :description
      t.integer :total_rooms
      t.decimal :price

      t.timestamps null: false
    end
  end
end
