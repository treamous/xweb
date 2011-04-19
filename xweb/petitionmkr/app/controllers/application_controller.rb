class ApplicationController < ActionController::Base
  #before_filter :confirm_logged_in
  layout 'admin'
  
  protect_from_forgery

#set the time zone
  def set_timezone
    Time.zone = 'Mountain Time (US & Canada)'
  end
  
  protected  
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'admin', :action => 'login')
      return false # halts the before_filter
    else
      return true
    end
  end
end
