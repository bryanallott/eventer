require 'eventer'

class LearnerSession < ActiveRecord::Base
  belongs_to :learner
  belongs_to :session

  validates_presence_of :learner
  validates_presence_of :session
  
  validates_associated :learner
  validates_associated :session

  validates_uniqueness_of [:learner_id, :session_id], :scope=> [:learner_id, :session_id], :message => "can only be associated with the session once"
  
  validates_inclusion_of :associated, :in => Eventer::Associations.values, :message => "associated must be one of the predefined values"
  
  validate :only_if_session_not_full

  def only_if_session_not_full
    errors.add_to_base("Can not add becuase session is limited to #{self.session.limit}") unless (self.session.learner_sessions.length < (self.session.limit))
  end
end
