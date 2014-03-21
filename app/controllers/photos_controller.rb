class PhotosController < ApplicationController
	require 'flickraw'
	
	def index		
		@photos = flickr.people.getPhotos(:user_id => "me", :per_page => 10,  :extras => 'media').photo
	end
end
