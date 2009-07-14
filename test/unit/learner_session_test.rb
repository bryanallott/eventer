require 'test_helper'

class LearnerSessionTest < ActiveSupport::TestCase
  test "cannot have duplictae learner sessions" do
    one = learner_sessions[:one]
    LearnerSession.new(one).save!
  end
end
