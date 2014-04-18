class ServicesController < ApplicationController
	require 'flickraw'
	def place
		if params[:id] && Place.exists?(params[:id])
			place = Place.find(params[:id])
			childrens = nil
			if(place.children_places.exists?)
				childrens = place.children_places
			end
			render :json => {:place => place, :childrens => childrens}, :callback => params[:callback]
		else
			render :json => nil, :callback => params[:callback]
		end
	end

	def way
		if params[:id] && Way.exists?(params[:id])
			way = Way.find(params[:id])		
			render:json => way.to_json(:only => [:id, :name, :start_date,:end_date, :album_flickr_nb, :comments, :distance], :include => {:transportation => {:only => :name}})
		end
	end

	def photo		
		begin
			photo = flickr.photos.getInfo(:photo_id => params[:id])
			photo_size = flickr.photos.getSizes(:photo_id => photo.id)
			if photo.media == "video"
				render :text => "<a href='"+photo_size.size[10].source+"' class='html5lightbox' data-width='"+photo_size.size[10].width+"' data-height='"+photo_size.size[10].height+"' title='"+photo.title+"' data-group='myGroup'><img src='"+ ApplicationHelper.make_flickr_url(photo, 's') +"' class='img-thumbnail'/><img src='/assets/video.png' style='position:absolute; margin-left:-80px;' /></a>"
			else
				render :text => "<a href='"+ApplicationHelper.make_flickr_url(photo, 'c')+"' class='html5lightbox' title='"+photo.title+"' data-group='myGroup'><img src='"+ ApplicationHelper.make_flickr_url(photo, 's') +"' class='img-thumbnail'/></a>"
			end
		rescue FlickRaw::FailedResponse => e
			render :text => "No images"
		end
	end

	def original
		begin
			photo = flickr.photos.getSizes(:photo_id => params[:id])
			redirect_to photo[11].source
		rescue FlickRaw::FailedResponse => e
			render :text => "Fail to get the original image"
		end
	end

	def album
		nb = 0
		if params[:nb]
			nb = params[:nb]
		end
		begin
			html = ""		
			photos = flickr.photosets.getPhotos(:photoset_id => params[:id],  :extras => 'media', :per_page => nb)
			photos.photo.each do |photo|
				photo_size = flickr.photos.getSizes(:photo_id => photo.id)
				if photo.media == "video"
					html += "<a href='"+photo_size.size[10].source+"' class='html5lightbox' data-width='"+photo_size.size[10].width+"' data-height='"+photo_size.size[10].height+"' title='"+photo.title+"' data-group='myGroup'><img src='"+ ApplicationHelper.make_flickr_url(photo, 's') +"' class='img-rounded'/><img src='/assets/video.png' style='position:absolute; margin-left:-80px;' /></a>"
				else
					original_link = '<a target="_blank" href="/services/original/'+photo.id+'">Download the original</a>'
					html += "<a href='"+ApplicationHelper.make_flickr_url(photo, 'c')+"' class='html5lightbox' title='"+original_link+"' data-group='myGroup'><img src='"+ ApplicationHelper.make_flickr_url(photo, 's') +"' class='img-rounded'/></a>"
				end
			end
			render :text => html
		rescue FlickRaw::FailedResponse => e
			render :text => "No images"
		end
	end
end