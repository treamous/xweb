class PetitionsController < ApplicationController
  
  before_filter :confirm_logged_in
  
  # GET /petitions
  # GET /petitions.xml
  def index
    @petitions = Petition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @petitions }
    end
  end

  # GET /petitions/1
  # GET /petitions/1.xml
  def show
#    @petition = Petition.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @petition }
#    end
  end

  # GET /petitions/new
  # GET /petitions/new.xml
  def new
    @petition = Petition.new
    @petition.username = session[:username]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @petition }
    end
    
  end

  # GET /petitions/1/edit
  def edit
    @petition = Petition.find(params[:id])
  end

  # POST /petitions
  # POST /petitions.xml
  def create
    
    @petition = Petition.new
    @petition.title = params[:title]
    @petition.description = params[:description]
    @petition.criteria = params[:criteria]
    @petition.closedate = params[:closedate]      
    @petition.username = session[:username]
    
    respond_to do |format|
      if @petition.save
        logger.debug("Petition info has been saved in create: #{@petition.title} ")
        format.html { redirect_to(:controller => 'users', :action => 'portfolio', :notice => 'Petition was successfully created.') }
        #format.xml  { render :xml => @petition, :status => :created, :location => @petition }
      else
        format.html { render :action => "new", :notice => 'Petition was not created. Try again.' }
        #format.xml  { render :xml => @petition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /petitions/1
  # PUT /petitions/1.xml
  def update
    @petition = Petition.find(params[:id])

    respond_to do |format|
      if @petition.update_attributes(params[:petition])
        format.html { redirect_to(@petition, :notice => 'Petition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @petition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /petitions/1
  # DELETE /petitions/1.xml
  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy

    respond_to do |format|
      format.html { redirect_to(petitions_url) }
      format.xml  { head :ok }
    end
  end
end
