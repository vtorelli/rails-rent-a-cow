class BookingsController < ApplicationController
  before_action :set_cow, only: [:new, :create]

  def new
    # @cow = Cow.find(params[:cow_id])
    @booking = Booking.new()
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.cow = @cow
    @booking.user = current_user
    if @booking.save
      redirect_to user_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_bookings
    @bookings = Booking.where(user_id: current_user).order(:start_date)
  end

  private

  def booking_params
    booking_param = params.require(:booking).permit(:start_date, :duration, :location)
  end

  def set_cow
    @cow = Cow.find(params[:cow_id])
  end
end
