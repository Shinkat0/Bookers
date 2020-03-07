class UsersController < ApplicationController
  def index
  	@book = Book.new
  	@user = current_user
  end

  def edit
    @user = current_user
  end

  def show
  end

  def update
    user = current_user
    if user.update(user_params)
      flash[:notice]='You have updated user successfully.'
      redirect_to users_path(current_user)
    else
      @user = user
      render :edit
    end
  end

  def destroy
  	user = user.find(params[:id])
  	user.delete

  end

  private
  def user_params
        params.require(:user).permit(:name, :Introduction, :profile_image)
  end
end
