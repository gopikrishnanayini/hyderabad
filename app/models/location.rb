class Location < ActiveRecord::Base
	belongs_to :event
	validates :address, presence: true
end
