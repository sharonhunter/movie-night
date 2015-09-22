require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  def setup
    @movie = movies(:alien)
    @movie.event = events(:january)
  end
  
  test 'has a valid fixture' do
    #@movie = movies(:alien)
    assert @movie.valid?
  end

  should belong_to(:event)
  should have_many(:votes)
  
 
  should validate_presence_of(:title)
  should validate_presence_of(:url)
  should validate_presence_of(:event)

end
