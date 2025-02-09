class SessionController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login successful"
    else
      flash[:alert] = "invalid password or email"
      render :index
    end
  end

  def destroy
     session[:user_id] = nil
     redirect_to root_path, notice: "Logged out"
  end
end
