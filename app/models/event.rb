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

end
