class NewusersController < ApplicationController
   before_filter :set_timezone
	  
  # GET /newusers
  # GET /newusers.xml
  def index
    new
    render(new)
  end
  
  # GET /newusers/new
  # GET /newusers/new.xml
  def new
    @newuser = User.new

    respond_to do |format|
      format.html # new.html.erb
     format.xml  { render :xml => @newuser }
    end
    #create
  end

  # POST /newusers
  # POST /newusers.xml
  def create
    @newuser = User.new
    @newuser.first_name = params[:first_name]
    @newuser.last_name = params[:last_name]
    @newuser.username = params[:username]
    @newuser.signature = params[:signature]
    @newuser.state = params[:state]
    @newuser.age = params[:age]
    @newuser.interest = params[:interest]
    @newuser.affiliation = params[:affiliation]
    @newuser.email = params[:email]

    saltwrd = User.make_salt(params[:username])
    @newuser.salt = saltwrd
    @newuser.hashed_password = User.hash_with_salt(params[:password], saltwrd)
    @newuser.password = params[:password]
    
    logger.debug("Create THIS user: #{@newuser.username} ")

    #respond_to do |format|
      if @newuser.save
        session[:user_id] = @newuser.id
        session[:username] = @newuser.username
        session[:signature] = @newuser.signature
        session[:user] = @newuser
		flash[:notice] = "User is successfully created"
        redirect_to(:controller => 'users', :action => 'portfolio', :notice => '#{@newuser.username} was successfully created.')
        #format.xml  { render :xml => @newuser, :status => :created, :location => @newuser }
      else
        respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @newuser.errors, :status => :unprocessable_entity }
        end
      end
    #end
  end
 
end
