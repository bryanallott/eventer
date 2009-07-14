class Client < ActiveRecord::Base
  has_many :sessions
  has_many :learners
  
  validates_presence_of :name
  validates_presence_of :client_key
  
end
