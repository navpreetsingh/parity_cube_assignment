# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

room_type = ["Deluxe Room", "Luxury Room", "Deluxe Suite", "Luxury Suite"]
description = ["Queen Size Bed", "Queen Size Bed and Pool Facing", "King Size Bed and Pool Facing", "King Size Bed, Pool Facing with a Gym"]
price = [7000, 8500, 12000, 20000]
total_rooms = [20, 20, 12, 8]
room_number = []
("A".."D").each {|char| (1..5).each {|no| room_number << "#{char} #{'%02d' % no}"}}
("A".."D").each {|char| (6..10).each {|no| room_number << "#{char} #{'%02d' % no}"}}
(11..20).each {|no| room_number << "D #{'%02d' %no}"}
(1..10).each {|no| room_number << "E #{'%02d' %no}"}
init = 0
room_type.each_with_index do |type, index|
	rt = RoomType.create(name: type, description: description[index], total_rooms: total_rooms[index], price: price[index])

	for ind in (init..(init + rt.total_rooms - 1))
		rt.rooms.create(number: room_number[ind])
	end
	init += rt.total_rooms 
end