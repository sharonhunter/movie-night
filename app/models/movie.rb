class Movie < ActiveRecord::Base

	belongs_to :event
	has_many :votes

	validates :title, presence: true
	validates :url, presence: true
	validates :event, presence: true

	validates :title, uniqueness: {
		scope: :event, 
		message: 'Already suggested for that event.', 
		case_sensitive: false
	}

	def vote
	   Vote.create(movie: self, event: event)
	end

end
