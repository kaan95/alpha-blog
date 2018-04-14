class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # by default, these methods are not available to our views, only to other controllers
  # by defining them as helper methods, rails makes them available for the views
  helper_method :current_user, :logged_in?
  
  def current_user 
    # finds/returns the user if there is a user id that's stored in our session hash
    # return current user if user already exists (already hit database), if not find user based on user id
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # !! converts into boolean
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
