class BooksController < ApplicationController
  before_action :authenticate_user! , except: [:top]

  def top

  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = current_user
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]='You have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]='You have creatad book successfully.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end

  end

  def edit
    @book = Book.find(params[:id])
    if current_user != @book.user
      redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
        params.require(:book).permit(:title, :body)
  end
end
