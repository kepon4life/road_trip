class PhotosController < ApplicationController
	require 'flickraw'
	
	def last		
		@photos = flickr.people.getPhotos(:user_id => "me", :per_page => 10,  :extras => 'media').photo
	end

	def place
		@photos = Array.new
		@place = Place.find(params[:id])
		if @place.album_flickr_nb != ""
			@photos = flickr.photosets.getPhotos(:photoset_id => @place.album_flickr_nb,  :extras => 'media').photo
		end
	end

end
