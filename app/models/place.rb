class Place < ActiveRecord::Base
	has_many :children_places, :class_name => "Place", :foreign_key => "parent_place_id"
	belongs_to :parent_place, :class_name => "Place"
	belongs_to :place_type
	validates :name, :presence => true
	validates :website, :presence => false
	validates :lat, :presence => true
	validates :lon, :presence => true
	validates :rating, :presence => true
	validates :start_date, :presence => true
	validates :end_date, :presence => true
	validates :place_type_id, :presence => true
end
