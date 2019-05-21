class InstrumentsController < ApplicationController

  def index
    @instruments = policy_scope(Instrument).all
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    authorize @instrument
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
    @instrument = Instrument.new
    @checkin = params['checkin']
    @checkout = params['checkout']
    if ((!@checkin.blank?) && (!@checkout.blank?))
      from = @checkin.split("/")
      to = @checkout.split("/")
      start = Date.new(from[2].to_f, from[1].to_f - 1, from[0].to_f)
      finish = Date.new(to[2].to_f, to[1].to_f - 1, to[0].to_f)
      @duration = (finish - start).to_f
      @total_price = (@duration * @instrument.price.to_f).round
    end
    @instrument = Instrument.find(params[:id])
    authorize @instrument
    @bookings = @instrument.bookings
    @alert_message = "This is #{@instrument.user.first_name}'s instrument"
  end

  def edit
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    authorize @instrument
    redirect_to instrument_path(@instrument)
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    authorize @instrument
    @instrument.destroy
    redirect_to root_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :price, :photo, :location, :booking_id, :category, :description)
  end
end
