# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

<<<<<<< HEAD
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/'
        else
            redirect_to '/signup'
        end
    end 
=======
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup', flash: { error: 'You entered something wrong here and Please make sure you enter all the fields correct' }
    end
  end
>>>>>>> efdf1b553b0c5d83adc6631b55a82318cb0c63ab

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
