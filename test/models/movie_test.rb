require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  def setup
    @movie = movies(:alien)
  end
  
  test 'has a valid fixture' do
    @movie = movies(:alien)
    assert @movie.valid?
  end

  should belong_to(:event)
  should have_many(:votes)
  
  # this line 9 is shoulda matcher, can replace line 11-22
  should validate_presence_of(:title)

  # test 'requires a title' do
  # 	@movie = Movie.new
  	
  # 	@movie.title = 'Big Lebowski'
  # 	assert @movie.valid?

  # 	@movie.title = nil
  # 	refute @movie.valid?

  # 	@movie.title = ''
  # 	refute @movie.valid?
  # end
  #this line 21 replaces 23- 35
  should validate_presence_of(:url)

  # test 'requires a url' do
  # 	@movie = Movie.new

  # 	@movie.url = 'http://www.example.com/'
  # 	assert @movie.valid?

  # 	@movie.url = nil
  # 	refute @movie.valid?

  # 	@movie.url = ''
  # 	refute @movie.valid?
  # end
end
