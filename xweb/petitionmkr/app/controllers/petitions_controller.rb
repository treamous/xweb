class PetitionsController < ApplicationController
  
  before_filter :confirm_logged_in
  before_filter :set_timezone
  
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
    @petition = Petition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @petition }
    end
  end

  # signable /petitions/signable
  # signable /petitions/signable.xml
  def signable
    @petition = Petition.find(params[:id])

    respond_to do |format|
      format.html # signable.html.erb
      format.xml  { render :xml => @petition }
    end
  end


  # signalready /petitions/signable
  # signalready /petitions/signable.xml
  def signalready
    @petition = Petition.find(params[:id])

    respond_to do |format|
      format.html # signalready.html.erb
      format.xml  { render :xml => @petition }
    end
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
    @end_date = Time.zone.local(*params[:seldate].sort.map(&:last).map(&:to_i)) 
    #@end_date = Time.zone(params[:seldate])
    logger.debug("Petition endate: #{@end_date} ")
    @petition.closedate = @end_date
    @petition.username = session[:username]
    
    respond_to do |format|
      if @petition.save
        logger.debug("Petition info has been saved in create: #{@petition.title} ")
		flash[:notice] = "Petition is successfully created"
        format.html { redirect_to(:controller => 'users', :action => 'portfolio', :notice => 'Petition was successfully created.') }
        #format.xml  { render :xml => @petition, :status => :created, :location => @petition }
      else
	 # respond_to do |format|
        format.html { render :action => "new", :notice => 'Petition was not created. Try again.' }
        format.xml  { render :xml => @petition.errors, :status => :unprocessable_entity }
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


  # unsignthisone /petitions/unsignthisone
  # unsignthisone /petitions/unsignthisone.xml
  #
  # Render page to commit signature or remove signature
  #
  def unsignthisone
  	userid = session[:user_id]
  	pet =   params[:petition]	
  	petid = params[:petid]
  	logger.debug(":petid:  #{petid} ")
  	@user = User.find(userid)
  	@petition = Petition.find(petid)
    #@signhere = SpAssociation.spatblbool(userid,petid)

    respond_to do |format|
			if SpAssociation.spatblbool(userid,petid)
				if SpAssociation.spatblrmv(userid,petid)
					# already signed -- remove then give option to sign
					format.html { render :action => "signable" }
					format.xml  { head :ok }
					format.xml  { render :xml => @user}
					format.xml  { render :xml => @petition }
				end
			else
					format.html { render :action => "signalready" }
					format.xml  { head :ok }
					format.xml  { render :xml => @user}
					format.xml  { render :xml => @petition }
			end
	end    
    
  end

  # signthisone /petitions/signthisone
  # signthisone /petitions/signthisone.xml
  #
  # Render page to commit signature or remove signature
  #
  def signthisone
  	userid = session[:user_id]  	
  	pet =   params[:petition]	
  	petid = params[:petid]
  	logger.debug(":petid:  #{petid} ")
  	@user = User.find(userid)
  	@petition = Petition.find(petid)
    #@signhere = SpAssociation.spatblbool(userid,petid)

    respond_to do |format|
			if SpAssociation.spatblbool(userid,petid)
				if SpAssociation.spatbladd(userid,petid)
					# already signed -- remove then give option to sign
					flash[:notice] = "Petition is successfully signed"
        format.html { redirect_to(:controller => 'users', :action => 'portfolio', :notice => '') }
				end
			else
			flash[:notice] = "Petition is successfully signed"
					 format.html { redirect_to(:controller => 'users', :action => 'portfolio', :notice => '') }
			end
	end
    
    
  end




  # cansign /petitions/cansign
  # cansign /petitions/cansign.xml
  #
  # Render page to commit signature or remove signature
  #
  def cansign
  	userid = session[:user_id]  	
  	petid = params[:petid]
  	@pid = petid
  	@user = User.find(userid)
  	@petition = Petition.find(params[:petid])
    #@signhere = SpAssociation.spatblbool(userid,petid)

    respond_to do |format|
      if SpAssociation.spatblbool(userid,petid)
      	# already signed -- give option to remove
        format.html { render :action => "signalready" }
        format.xml  { head :ok }
        format.xml  { render :xml => @user}
        format.xml  { render :xml => @petition }
        format.xml  { render :xml => @pid }
      else
      	# not already signed -- give option to add
        format.html { render :action => "signable" }
        format.xml  { head :ok }
        format.xml  { render :xml => @user}
        format.xml  { render :xml => @petition }
        format.xml  { render :xml => @pid }
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
