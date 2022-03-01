class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if(@user.update(user_params))
      flash[:notice] = "User's status updated."
      redirect_to friends_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:admin)
  end
end
