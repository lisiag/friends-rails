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
      if (is_admin?)
        redirect_to users_path
      else
        redirect_to root_path
      end
    else
      render 'edit'
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :admin)
  end
end
