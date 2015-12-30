class RoomTypesController < ApplicationController
  
	# It fetches the room types in hotel 
  def index  	
  	@room_types = RoomType.all
  	respond_to do |format|
  		format.html
  		format.json {render json: @room_types }
    end
  end

  # A small page to gather the details of check in and check out from the user
  def book
  end
end
