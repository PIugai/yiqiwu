class Api::V1::EventsController < Api::V1::BaseController
  before_action :set_event, only: [:show]

  def index
    @events = Event.all
  end

  def show
    @user = User.find(params[:user_id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:user_id, :type, :capacity, :spots_filled, :description, :start_time, :end_time, :location, :latitude, :longitude, :photo)
  end

  def render_error
    render json: { errors: @event.errors.full_messages },
      status: :unprocessable_entity
  end
end
