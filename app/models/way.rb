class Way < ActiveRecord::Base
	belongs_to :transportation
	validates :name, :presence => true
	validates :distance, :presence => true
	validates :coordinates, :presence => true
	validates :start_date, :presence => true
	validates :end_date, :presence => true
	validates :transportation_id, :presence => true
end
