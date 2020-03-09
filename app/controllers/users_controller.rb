class UsersController < ApplicationController

  def index
  	@book = Book.new
  	@user = current_user
    @users = User.all
  end

  def about
  end

  def edit
    @user = current_user
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
      redirect_to users_path(current_user)
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
        params.require(:user).permit(:name, :Introduction, :profile_image)
  end
  def book_params
        params.require(:book).permit(:title, :body)
  end
end

