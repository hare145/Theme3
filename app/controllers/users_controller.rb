class UsersController < ApplicationController

  def show
    @user_info = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user_info = User.find(params[:id])
  end
  
  def update
   @user_info = User.find(params[:id])
   @user_info.update(user_params)
   redirect_to user_path(@user_info.id)
  end
  
  def index
    @book = Book.new
    @users = User.all
    @user = User.find(current_user.id)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, )
  end
  
end
