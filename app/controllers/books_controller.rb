class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user.id)
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

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(current_user.id)
  end

  def update
    @book = ユーザーの取得
    @book.ユーザーのアップデート
    redirect_to ユーザーの詳細ページへのパス
  end





  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
