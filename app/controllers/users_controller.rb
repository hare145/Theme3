class UsersController < ApplicationController

 before_action :matching_user, only: [:edit, :update]

  def show
    @user_info = User.find(params[:id])
    @book = Book.new
    @books = @user_info.book
  end

  def edit
    @user_info = User.find(params[:id])
  end
  
  def update
   @user_info = User.find(params[:id])
   if @user_info.update(user_params)
     redirect_to user_path(@user_info.id),
     notice: "You have updated user successfully."
   else
     render :edit
   end
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
  
  def matching_user
   user = User.find(params[:id])
   unless user.id == current_user.id
     redirect_to user_session_path
   end
  end 

end
