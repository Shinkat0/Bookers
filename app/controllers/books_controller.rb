class BooksController < ApplicationController
  def top

  end


  def index
  end

  def show
  end

  def new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      flash[:notice]='You have creatad book successfully.'
      redirect_to book_path(book.id)
    else
      @books = Book.all
      @book = book
      render :index
    end

  end

  def edit
  end

  private
  def book_params
        params.require(:book).permit(:title, :body)
  end
end
