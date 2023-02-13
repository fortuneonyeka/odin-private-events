class SessionController < ApplicationController
  def create
    user = User.find_by_name(params[:name])

    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "You are logged in"

    else
      flash.now.alert = "Incorrect name or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nill
    redirect_to root_path, notice: "You are logged out"
  end
end
