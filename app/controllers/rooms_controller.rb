class RoomsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?

  # Get the details of rooms available for the dates on which user wants to check-in
  def index        
  	dates = params[:room]
  	@check_in = dates[:check_in].to_date
  	@check_out = dates[:check_out].to_date    
  	@room_type_id = params[:room_type_id]
  	if @check_out > @check_in and !(@room_type_id.nil?)
  		@rooms = Room.available_rooms(@room_type_id, @check_in, @check_out) 
      respond_to do |format|
        format.html
        format.json { render json: @rooms }
      end 		
  	else 
  		@notice = "Check In Date is more than Check Out Date!!!"
      respond_to do |format|
  		  format.html {render "room_types/book"}
        format.json { render json: @notice }
      end
  	end
  end

  # Book the rooms for particular dates and room type
  def book    
    dates = params[:book_room]
    @check_in = dates[:check_in].to_date
    @check_out = dates[:check_out].to_date        
    @room_type_id = dates[:room_type_id]
    @room_ids = params[:room_ids]        
    if @check_out > @check_in and !(@room_type_id.empty?)
      @rooms = Room.booked_room_ids(@room_type_id, @check_in, @check_out) 
      @room_nos = ""
      @room_ids = @room_ids.split(",") if @room_ids.is_a? String     
      @room_ids.each do |room|
        unless @rooms.include? room
          current_user_id = current_user.nil? ? nil : current_user.id
          Booking.create(user_id: current_user_id,room_id: room, room_type_id: @room_type_id, check_in: @check_in, check_out: @check_out)
          @room_nos << Room.find_by_id(room).number + "   "
        end
      end
      respond_to do |format|
        format.html
        format.json {render json: {room_no: @room_nos, check_in: @check_in, check_out: @check_out}}
      end
    else 
      @notice = "Check In Date is more than Check Out Date!!!"
      respond_to do |format|
        format.html {render "room_types/book"}
        format.json { render json: @notice }
      end      
    end
  end

  protected

  def json_request?
    request.format.json?
  end
end
