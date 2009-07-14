module LearnerSessionsHelper
  def my_learners
    return Learner.all(:conditions => {:client_id => @client})
  end
  
  def my_sessions
    return Session.all(:conditions => {:client_id => @client})
  end
end
