class RegistrationController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_parms)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Succefully created account"
    else
      flash[:alert]="Something went wrong"
      render :new
    end
  end

  def user_parms
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
