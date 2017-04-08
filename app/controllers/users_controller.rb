class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Signed up!"
      redirect_to users_path
    else
      flash.now[:error] = 'Sorry, try again!'
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
