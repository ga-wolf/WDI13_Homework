class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
  book = Book.create book_params
  redirect_to book
  end

  def edit
  book = Book.create book_params
  end

  def update
   book = Book.find params[:id]
   book.update book_params
   redirect_to book
  end


  def index
    @books = Book.all
  end

  def edit
  end

  private
  def book_params
  params.require(:book).permit(:name, :author,:image)
  end

  def show
    @book = Book.find params[:id]
  end

  def destroy
  book = Book.find params[:id]
  book.destroy
  redirect_to books_path
  end


end
