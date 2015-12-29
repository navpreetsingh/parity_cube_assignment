class RoomsController < ApplicationController
  def index
  	dates = params[:room]
  	@check_in = dates[:check_in].to_date
  	@check_out = dates[:check_out].to_date
  	@room_type_id = params[:room_type_id]
  	if @check_out > @check_in
  		@rooms = Room.available_rooms(@room_type_id, @check_in, @check_out)  		
  	else 
  		@notice = "Check In Date is more than Check Out Date!!!"
  		render "room_types/book"
  	end
  end

  def book
  end
end
