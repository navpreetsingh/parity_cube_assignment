class RoomTypesController < ApplicationController
  def index  	
  	@room_types = RoomType.all
  end

  def book
  end
end
