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
    @book = Book.new
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path

  end

  def edit
  end

  private
  def book_params
        params.require(:book).permit(:title, :body)
  end
end
