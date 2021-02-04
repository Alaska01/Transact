class UsersController < ApplicationController
 before_action :correct_user, only: [:edit, :update]

 

  def new
    @user = User.new
  end

  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Transaction App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to user_url
  end

    private

    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end


end
