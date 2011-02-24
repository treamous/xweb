class LoginsController < ApplicationController
  # POST /logins
  # POST /logins.xml
  def index

  end

  # GET /logins/1
  # GET /logins/1.xml
  def show

  end

  # GET /logins/new
  # GET /logins/new.xml
  def new

  end

  # GET /logins/1/edit
  def edit

  end

  # POST /logins
  # POST /logins.xml
  def create
    @login = Login.new(params[:login])

    respond_to do |format|
      if @login.save
        format.html { redirect_to(logins_url,
          :notice => "Login #{@login.name} was successfully created.") }
        format.xml  { render :xml => @logins,
          :status => :created, :location => @login }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @login.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # PUT /logins/1
  # PUT /logins/1.xml
  def update

  end

  # DELETE /logins/1
  # DELETE /logins/1.xml
  def destroy
    @login = Login.find(params[:id])
    @login.destroy

    respond_to do |format|
      format.html { redirect_to(logins_url) }
      format.xml  { head :ok }
    end
  end
end