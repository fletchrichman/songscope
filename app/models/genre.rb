class Genre < ActiveRecord::Base
#	attr_accessible :name

	validates_uniqueness_of :name

	belongs_to :artist
end
