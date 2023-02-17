class EventsController < ApplicationController
  before_action :require_login, except: [:index]
  

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.create(event_params)

    if @event.save
      flash[:success] = "Event '#{@event.name}' created!"
      redirect_to @event
    else
      flash[:alert] = "Please fix these #{@event.errors.count} errors below!"
      render :new, status: :unprocessable_entity
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description, :user_id)
  end
end
