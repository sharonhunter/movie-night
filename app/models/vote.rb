class Vote < ActiveRecord::Base
	validates :name, presence: true
	#validates_presence_of :movie, presence: true

	#belongs_to :movie
end