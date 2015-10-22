class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    # this line had to be added to allow access to creating a movie
    # on the event show page, it previously only returned the event using
    # the before_action method above
    @movie = Movie.new
  end

  def new
  	@event = Event.new
  end

  def edit
  end

  def create
      @event = Event.new(event_params)
    
    if @event.save
      redirect_to @event, notice: 'Event created successfully'
    else
      render :new
    end
  end

  def update

    if @event.update(event_params)
      redirect_to @event, notice: 'Event updated successfully.'
    else
      render :edit
    end
  end

  def destroy
     @event.destroy

     if @event.destroy
      redirect_to events_path, notice: 'Event was deleted succesfully.'
    else
      render :show
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:location, :occurs_at)
    end
  end


