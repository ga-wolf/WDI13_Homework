class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.create book_params
    redirect_to book
  end

  def index
    @books = Book.all
  end

  def edit
    @book = Book.find params[:id]
  end

  def show
    @books = Book.find params[:id]
  end

  def destroy
    book = Book.find params[:id]
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :year, :generates, :image, :author_id)
end
end
