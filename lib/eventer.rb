require File.dirname(__FILE__) + '/enum'
  
module Eventer

  Associations = Enum.new(:GROUP, :INDIVIDUAL, :STDY_MODULE)
  AssociationValues = {0=>"by group", 
                    1=>"as an individual", 
                    2=>"per study module"}
  
end