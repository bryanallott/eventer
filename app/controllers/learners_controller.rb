class LearnersController < NestedClientsController

  def index
    @learners = @client.learners
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @learner = Learner.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @learner = Learner.new(:client=>@client)
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @learner = Learner.find(params[:id])
  end

  def create
    @learner = Learner.new(params[:learner])
    @learner.client=@client
    respond_to do |format|
      if @learner.save
        flash[:notice] = 'Learner was successfully created.'
        format.html { redirect_to([@client, @learner]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @learner = Learner.find(params[:id])

    respond_to do |format|
      if @learner.update_attributes(params[:learner])
        flash[:notice] = 'Learner was successfully updated.'
        format.html { redirect_to(@learner) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @learner = Learner.find(params[:id])
    @learner.destroy

    respond_to do |format|
      format.html { redirect_to(learners_url) }
    end
  end
end
