class MapController < ApplicationController
	def index
		@places_first_level = Place.where(:parent_place_id => nil)
		@ways = Way.all

	end

	def test
	end
end
