class BooksController < ApplicationController
  
  before_action :authenticate_user!
  before_action :matching_user, only: [:edit, :update, :destroy]

  def index
    @book = Book.new
    @books = Book.all
    @book_info = Book.new
    @user = User.find(current_user.id)
  end


  def create
    @book_info = Book.new(book_params)
    @book_info.user_id = current_user.id
    if@book_info.save
      redirect_to book_path(@book_info),
      notice: "You have created book successfully."
    else
     @book = Book.new
     @books = Book.all
     @user = User.find(current_user.id)
      render :index
    end
    
  end


  def show
    @book = Book.new
    @booker = Book.find(params[:id])
    @user = @booker.user_id
    @user_info = User.find(@user)
  end

  def edit
    @book_info = Book.find(params[:id])
  end
  
  def update
    @book_info = Book.find(params[:id])
    if @book_info.update(book_params)
     redirect_to book_path(@book_info.id),
     notice: "You have updated book successfully."
    else
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def matching_user
    booker = Book.find(params[:id])
    user = booker.user_id
    user_info = User.find(user)
   unless user_info.id == current_user.id
     redirect_to books_path
   end
  end 
end
