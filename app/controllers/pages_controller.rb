class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if params[:search].nil? || params[:search] == ""
      @instruments = Instrument.all
    elsif Instrument.search_by_name_and_location_and_category(params[:search]).empty?
      redirect_to(root_path, alert: "Nothing found, try again!")
    else
      @instruments = Instrument.search_by_name_and_location_and_category(params[:search])
    end
  end

end
