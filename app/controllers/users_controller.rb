class UsersController < ApplicationController
  def my_instruments
    @user = current_user
    authorize @user
    @instruments = @user.instruments
  end
end
