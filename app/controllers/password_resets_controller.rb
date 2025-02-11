class PasswordResetsController  < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ email: params[:email] })
    if @user.present?
      # send a email
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: "If the account is registered, we will send an email for password reset."
  end
end
