require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  def setup
  	@vote = votes(:vote1)
  	@vote.movie = movies(:alien)
    @vote.event = events(:january)
  end

  test "has a valid fixture" do 
  	assert @vote.valid?
  end

  # these test that they are related
  should belong_to(:event)
  should belong_to(:movie)

  # these test that there is a value for these present in the DB before being saved
  # do not use these for fk_id's, only the other model
  
  should validate_presence_of(:event)
  should validate_presence_of(:movie)
  
end
