class Session < ActiveRecord::Base
  belongs_to :client
  
  has_many :learner_sessions
  has_many :learners, :through => :learner_sessions, :source => :learner
  
  validates_presence_of :client
  validates_associated :client
  
  validates_presence_of :friendly
  validates_presence_of :reference
  
end
