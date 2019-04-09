class Api::V1::BookingsController < Api::V1::BaseController

  def index
    # this is probably wrong - check how to use user_id
    @bookings = Booking.all
    @user = User.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render :index, status: :created
    else
      render_error
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      render :show
    else
      render_error
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :user_id, :event_id, :review)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
