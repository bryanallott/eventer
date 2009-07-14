require 'eventer'

class LearnerSessionsController < ApplicationController

  before_filter :find_client_session
  
  def index
    @learner_sessions = @session.learner_sessions
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @learner_session = LearnerSession.find(params[:id], :conditions => {:session_id => @session})
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @learner_session = LearnerSession.new
    @learner_session.session = @session
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @learner_session = LearnerSession.find(params[:id], :conditions => {:session_id => @session})
  end

  def create
    @learner_session = LearnerSession.new(params[:learner_session])
    @learner_session.session = @session
    @learner_session.associated = Eventer::Associations::INDIVIDUAL
    @learner_session.association_friendly = ""
    @learner_session.invited = Date.today
    
    respond_to do |format|
      if @learner_session.save
        flash[:notice] = 'The learner and session was successfully paired.'
        format.html { redirect_to([@client, @learner_session.session, @learner_session]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @learner_session = LearnerSession.find(params[:id], :conditions => {:session_id => @session})
    respond_to do |format|
      if @learner_session.update_attributes(params[:learner_session])
        flash[:notice] = 'LearnerSession was successfully updated.'
        format.html { redirect_to([@client, @learner_session.session, @learner_session]) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @learner_session = LearnerSession.find(params[:id], :conditions => {:session_id => @session})
    @learner_session.destroy
    respond_to do |format|
      format.html { redirect_to(client_session_learner_sessions_url(@client, @session)) }
    end
  end

private
  def find_client_session
    @client = Client.find(params[:client_id])
    @session = Session.find(params[:session_id])
  end
end
