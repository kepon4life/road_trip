module ApplicationHelper

	def self.make_flickr_url(r, size = 't')
     	return "http://farm#{r.farm}.static.flickr.com/" <<
			"#{r.server}/#{r.id}_#{r.secret}_#{size}.jpg"
 	end

  	def make_flickr_url(r, size = 't')
    	return ApplicationHelper.make_flickr_url(r, size)
  	end
end
