class Trip < ActiveRecord::Base
	belongs_to :politician
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :expenses, presence: true
	validates :details, presence: true
end
