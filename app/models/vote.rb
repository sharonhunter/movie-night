class Vote < ActiveRecord::Base
	
	belongs_to :event
	belongs_to :movie

	validates :name, presence: true

end