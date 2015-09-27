require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # this method has to have this name "setup" to setup a context
  def setup
  	@event = events(:january)
  end

  test "has a valid fixture" do 
  	assert @event.valid?
  end

  should have_many(:movies)
  should have_many(:votes)
  
  should validate_presence_of(:occurs_at)
  should validate_presence_of(:location)

  should validate_uniqueness_of(:location).
  scoped_to(:occurs_at).
  with_message('There is already an event scheduled there at that time.').
  case_insensitive

end
