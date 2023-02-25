class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @bookings = Booking.all
  end

  def create
    @guitar = Guitar.find(params[:guitar_id])
    @booking = @guitar.bookings.build(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to @guitar, notice: "Booking created successfully."
    else
      puts @booking.errors.full_messages
      redirect_to @guitar, notice: "Booking failed."
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to @booking
    else
      render :edit
    end
  end

  def update
  end

  def destroy
    # @booking = Booking.find(params[:id])
    # @booking.destroy
    # redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guitar_id)
  end
end
