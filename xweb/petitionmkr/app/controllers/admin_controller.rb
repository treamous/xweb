class AdminController < ApplicationController

  def index
    login
    render('login')
  end

  def login
    # login form
  end
  
 def attempt_login

    authorized_user = User.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:signature] = authorized_user.signature
      session[:user] = authorized_user
      flash[:notice] = "You are now logged in."
      redirect_to(:controller => 'users', :action => 'portfolio')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
    
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    session[:password] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end


end
