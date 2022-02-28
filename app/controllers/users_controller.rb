class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to adminpanel_path
    else
      render 'edit'
    end
  end
end
