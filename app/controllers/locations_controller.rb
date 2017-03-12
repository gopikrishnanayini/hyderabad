class LocationsController < ApplicationController
  def index
  	@locations = Location.all
  end
  def new
  	@event = Event.find(params[:event_id])
  	#binding.pry
  	@location = @event.build_location
  end

  def create
  	#binding.pry
  	@event = Event.find(params[:event_id])
  	#inding.pry
  	@location = @event.build_location(location_params)
  	respond_to do |format|
      if @location.save
        format.html { redirect_to event_locations_path(@event), notice: 'event was successfully created.' }
        #format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        #format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @location = Location .find(params[:id])
  end

  private
  def location_params
  	params.require(:location).permit(:address, :event_id)
  end
end
