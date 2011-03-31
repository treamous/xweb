class ApplicationController < ActionController::Base
  #before_filter :confirm_logged_in
  layout 'admin'
  
  protect_from_forgery
  
  #protected
  #def authorize
  #      unless User.find_by_id(session[:user_id])
  #        redirect_to(:controller => 'admin', :action => 'login') 
         # flash[:notice] = "Please log in"
  #      end
  #end

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
