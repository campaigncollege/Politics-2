class Politician < ActiveRecord::Base
	has_many :trips
	validates :name, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :office, presence: true
end
