class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
    @cow = Cow.find(params[:cow_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @cow = Cow.find(params[:cow_id])
    @booking.user = current_user
    @booking.cow = @cow
    @booking.total_cost = @booking.duration.to_i * @cow.price_per_day
    if @booking.save
      redirect_to bookings_path
    else
      render :new
  end

  def index_by_user
    @booking = Booking.where(user: current_user)
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :duration, :location)
  end
end
