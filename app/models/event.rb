class Event < ActiveRecord::Base

	attr_reader :movie

	has_many :movies
	has_many :votes

	validates :occurs_at, presence: true
	validates :location, presence: true
	validates :location, uniqueness: {
		scope: :occurs_at, 
		message: 'There is already an event scheduled there at that time.', 
		case_sensitive: false
	}

  # the test for this does not pass and is now missing from Tim's repo
  # NoMethodError: undefined method `movie' for nil:NilClass
  def winning_movie
    Vote.where(movie: movies).select(:movie_id).group(:movie_id).order('count(id) desc').first.movie
  end

end
