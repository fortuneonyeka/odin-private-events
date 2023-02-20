class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash.notice = "User #{@user.name}, you are welcome and thank you for signing up!"
      redirect_to root_path
    else
      flash[:alert] = "Please fix these #{@user.errors.count} errors! below"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
