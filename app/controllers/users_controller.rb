class UsersController < ApplicationController
  before_action :authenticate_user! , except: [:about]

  def index
  	@book = Book.new
  	@user = current_user
    @users = User.all
  end

  def about
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def update
    user = current_user
    if user.update(user_params)
      flash[:notice]='You have updated user successfully.'
      redirect_to user_path(current_user)
    else
      @user = user
      render :edit
    end
  end

  def destroy
  	user = User.find(params[:id])
  	user.delete
  end

  private
  def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

