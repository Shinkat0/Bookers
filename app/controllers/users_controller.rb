class UsersController < ApplicationController
  def index
  	@book = Book.new
  	@user = current_user
  end

  def edit
  end

  def show
  end

  def destroy
  	user = user.find(params[:id])
  	user.delete

  end
end
