#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class UsersController < ApplicationController
  before_filter :confirm_logged_in
  
  # GET /users
  # GET /users.xml
  def index
    username = session[:username]
    @mypetitions = Petition.search(username)
  end

  # author Tre Jeffries
  # GET /users/2
  # GET /users/2.xml
  def portfolio
    username = session[:username]
    userid = session[:user_id]
    @user = User.find(userid)
    @mypetitions = Petition.search(username)
    @signpetitions = Petition.searchsignup(username)
    
    if @user
      respond_to do |format|
        format.html # portfolio.html.erb
        format.xml  { render :xml => @user}
        format.xml  { render :xml => @mypetitions}
        format.xml  { render :xml => @signpetitions}
      end
    else
      flash[:notice] = "An error occured while logging in, please try again."
      redirect_to(:controller => 'admin', :action => 'login')
    end
  end


  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    userid = session[:user_id]
    @user = User.find(userid)
    respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @user }
    end

  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_url,
          :notice => "User #{@user.username} was successfully created.") }
        format.xml  { render :xml => @user,
          :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    userid = session[:user_id]
    @user = User.find(userid)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_url,
          :notice => "User #{@user.username} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    userid = session[:user_id]
    @user = User.find(userid)
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end