require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  def setup
    @movie = movies(:alien)
    @movie.event = events(:january)
  end
  
  test 'has a valid fixture' do
    assert @movie.valid?
  end

  should belong_to(:event)
  should have_many(:votes)
  
 
  should validate_presence_of(:title)
  should validate_presence_of(:url)
  should validate_presence_of(:event)

  should validate_uniqueness_of(:title).
  scoped_to(:event_id).
  with_message('Already suggested for that event.').
  case_insensitive

  test 'should allow voting' do
    @movie.vote
    @movie.vote
    @movie.vote

    assert_equal @movie.votes.count, 4
  end

  
end
