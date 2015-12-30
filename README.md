# parity_cube_assignment

How to run the site

1. Clone the code to your desktop
	Command: git clone git@github.com:navpreetsingh/parity_cube_assignment.git
2. Install the bundle
	Command: bundle install
3. Create the database and seed the database with initial data
	Command: rake db:create && rake db:migrate && rake db:seed
4.  Run the project 
	rails s

FOR API
1. To get the list of ROOM TYPES: 
	GET: https://stark-caverns-7556.herokuapp.com/room_types.json
2. To get the available ROOMS for particular dates
	POST: https://stark-caverns-7556.herokuapp.com/rooms/index.json
		DATA: 
			room[:check_in] = date
			room[:check_out] = date
			room_type_id = Room Type Id, desc: "Deluxe Room: 1, Luxury Room: 2, Deluxe Suite: 3, Luxury Suite: 4"
3. To Book a room: 
	POST: https://stark-caverns-7556.herokuapp.com/rooms/book.json
		DATA: 
			book_room[:check_in] = data
			book_room[:check_out] = data
			book_room[:room_type_id] = Room Type Id
			room_ids = "1,2,3", desc: "Ids of the room you have booked"