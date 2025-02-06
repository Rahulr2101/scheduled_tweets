class MainController < ApplicationController
  def index
    flash[:alert] = "Invalid email or password"
    flash[:notice] = "Logged in Successfully"
  end
end
