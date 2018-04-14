class SessionsController < ApplicationController
  def new 
    
  end
  
  def create
    # get the email of the user
    user = User.find_by(email: params[:session][:email].downcase)
    # verify if email is valid and password is valid
    if user && user.authenticate(params[:session][:password])
      # saving user's id in session's hash which is backed by browser's cookies
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully"
      redirect_to user_path(user)
    # password wasn't correct
    else
      flash.now[:danger] = "Email or Password was invalid."
      render 'new'
      
    end
    
  end
  
  # for logging out - will stop the session
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end