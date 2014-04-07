class PhotosController < ApplicationController
	require 'flickraw'
	
	def last		
		@photos = flickr.people.getPhotos(:user_id => "me", :per_page => 10,  :extras => 'media').photo
	end

	def place
		@place = Place.find(params[:id])

		@photos = flickr.photosets.getPhotos(:photoset_id => @place.album_flickr_nb,  :extras => 'media').photo


	end

end
