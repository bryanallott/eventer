class Learner < ActiveRecord::Base
  belongs_to :client
  has_many :learner_sessions
  has_many :sessions, :through => :learner_sessions, :source => :session

  validates_associated :client
  validates_presence_of :client
  
  validates_presence_of :friendly
  validates_presence_of :reference
  
end
