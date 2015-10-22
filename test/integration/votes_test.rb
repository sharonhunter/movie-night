require 'test_helper'

class VotesTest < ActionDispatch::IntegrationTest
  test "Event page shows how many votes each movie has" do 
  	january = events(:january)
  	alien = movies(:alien)
  	tron = movies(:tron)

  	visit event_path(january)

  	assert find("li", text: alien.title).has_content?("Votes: #{alien.votes.count}")
  	assert find("li", text: tron.title).has_content?("Votes: #{tron.votes.count}")
  end

  test "Event page allows you to vote for a movie" do
  	january = events(:january)
  	alien = movies(:alien)
    assert_equal 1, alien.votes.count

  	visit event_path(january)

  	movie_row = find("li", text: alien.title)
  	movie_row.click_link('Vote')

	assert_equal 2, alien.votes.count
	assert movie_row.has_content?('Votes:2')
  
  end
end
