class SessionsController < NestedClientsController
  
  def index
    @sessions = @client.sessions
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @session = Session.find(params[:id], :conditions => {:client_id => @client})
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @session = Session.new
    @session.client = @client
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @session = Session.find(params[:id], :conditions => {:client_id => @client})
  end

  def create
    @session = Session.new(params[:session])
    @session.client = @client
    respond_to do |format|
      if @session.save
        flash[:notice] = 'Session was successfully created.'
        format.html { redirect_to([@client, @session]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @session = Session.find(params[:id], :conditions => {:client_id => @client})
    @session.client = @client
    
    respond_to do |format|
      if @session.update_attributes(params[:session])
        flash[:notice] = 'Session was successfully updated.'
        format.html { redirect_to([@client, @session]) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @session = Session.find(params[:id], :conditions => {:client_id => @client})
    @session.destroy

    respond_to do |format|
      format.html { redirect_to(client_sessions_url(@client)) }
    end
  end
  
end
