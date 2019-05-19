class BookingsController < ApplicationController

def new
  @booking = Booking.new
  @instrument = Instrument.find(params[:instrument_id])
  authorize @booking
end

def create
  @instrument = Instrument.find(params[:instrument_id])
  @booking = Booking.new(booking_params)
  @booking.instrument = @instrument
  @booking.user = current_user
  @booking.status = "Pending validation by renter"
  authorize @booking
  @booking.save
  if @booking.checkout && @booking.checkin
    @booking.value = (@booking.checkout - @booking.checkin).to_f * @booking.instrument.price.to_f
  else
    @booking.value = 0
  end
  if @booking.save
    redirect_to booking_path(@booking)
  else
    redirect_to instrument_path(@instrument)
  end
end

  def index
    @bookings = Booking.where(user_id: current_user.id)
    @review = Review.new
  end

  def show
    @booking = Booking.find(params[:id])
    @instrument = @booking.instrument
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = "Pending validation by renter"
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin, :checkout)
  end

end
