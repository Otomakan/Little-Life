class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to current_user
    end
  end
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to user
  	else
  		flash[:danger]= "Sorry my friend You made a mistake typing in your username and/or your password"
  		render 'new'
  	end
  end

  def destroy
  	reset
  	redirect_to root_url
  end
end
