class BookingsController < ApplicationController
  def index
    @Bookings = Booking.all
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = @flat.bookings.build(booking_params)
    if @booking.save
      redirect_to @flat, notice: "Booking created successfully."
    else
      puts @booking.errors.full_messages
      render "flats/show", notice: "Booking failed."
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    if @booking.update
      redirect_to @booking
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id)
  end
end
