class Event < ActiveRecord::Base
	has_one :location
	validates :name, length: { minimum: 4 }, uniqueness: true
	validates :place, presence: true
	validates :date, presence: true
end
