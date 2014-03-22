class MapController < ApplicationController
	def index
		@places_first_level = Place.where(:parent_place_id => nil)
		puts @places_first_level
	end
end
