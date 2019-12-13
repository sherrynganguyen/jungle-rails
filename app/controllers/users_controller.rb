class UsersController < ApplicationController
  def index
  end
  def new
  end
  def create

    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      @msg = user.errors.messages[:email][0]
      redirect_to :back, notice: "Email #{@msg}"
    end
  end
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
