class MapController < ApplicationController
	def index
		@places_first_level = Place.where(:parent_place_id => nil).pluck(:lat, :lon, :place_type_id)
		puts @places
	end
end
