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

  should belong_to(:event)
  should belong_to(:movie)

  should validate_presence_of(:name)
  should validate_presence_of(:event)
  should validate_presence_of(:movie)
  
end
