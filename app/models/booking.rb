class Booking < ActiveRecord::Base
  belongs_to :room
  belongs_to :room_type
  belongs_to :user
end
