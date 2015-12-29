class RoomType < ActiveRecord::Base
	has_many :rooms, dependent: :destroy
	validates :name, uniqueness: true
	has_many :bookings
end
