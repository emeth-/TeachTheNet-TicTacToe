class EventsController < ApplicationController
  def new
  	@event=current_user.created_events.build
  end

  def create
  	if !current_user.nil?
	  	@event=current_user.created_events.build(event_params)
	  	if @event.save
	  		flash[:success] = "Event created"
	  		redirect_to @event
	  	else
	  		render 'new'
	  	end
	end

  end

  def show
  	@event=Event.find(params[:id])
  	@creator= User.find(@event.creator_id)
  end

  def index
  	@events=Event.all
  end


  private
	  def event_params
	  	params.require(:event).permit(:date, :location, :creator_id, :description)
	  end
end
