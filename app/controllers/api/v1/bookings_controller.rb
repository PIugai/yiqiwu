class Api::V1::BookingsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    # this is probably wrong - check how to use user_id
    @bookings = Booking.all
    @user = User.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
  end

  private

  def booking_params
    params.permit(:id, :user_id, :event_id, :review)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
