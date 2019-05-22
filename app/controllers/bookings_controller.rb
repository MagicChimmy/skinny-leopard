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
    redirect_to bookings_path
  else
    redirect_to instrument_path(@instrument)
  end
end

  def index
    @bookings = policy_scope(Booking)
    @other_bookings = current_user.instruments.map(&:bookings).reject(&:empty?)
    @review = Review.new
  end

  def show
    @booking = Booking.find(params[:id])
    @instrument = @booking.instrument
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      @booking.status = "Pending validation by renter"
      authorize @booking
      @booking.save
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin, :checkout)
  end

end
