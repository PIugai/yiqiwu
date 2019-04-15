class Api::V1::BookingsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_booking, only: [:update, :destroy]

  def index
    # this is probably wrong - check how to use user_id
    @bookings = Booking.all
    @user = User.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    @event = Event.find(params[:event_id])
    @event.update(spots_filled: @event.spots_filled + 1)
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking.destroy
    head :no_content
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.permit(:id, :user_id, :event_id, :review)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
