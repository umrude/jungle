# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup', flash: { error: 'You entered something wrong here and Please make sure you enter all the fields correct' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
