class BookingsController < ApplicationController
  before_action :set_cow, only: [:new, :create, :edit, :update]
  before_action :set_booking, only: [:edit, :update, :destroy]

  def new
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

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to user_bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_bookings_path, status: :see_other
  end

  def user_bookings
    @bookings = Booking.where(user_id: current_user).order(:start_date)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :duration)
  end

  def set_cow
    @cow = Cow.find(params[:cow_id])
  end
end
