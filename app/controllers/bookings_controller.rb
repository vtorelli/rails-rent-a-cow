class BookingsController < ApplicationController
  def new
    @cow = Cow.find(params[:cow_id])
    @booking = Booking.new
  end
end
