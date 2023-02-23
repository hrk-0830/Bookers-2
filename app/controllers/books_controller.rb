class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @users = @book.user
    if @book.save
      redirect_to book_path(@books.id)
    else
      render :show
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @books = Book.new
    @users = @book.user
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