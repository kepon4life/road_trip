class PlaceType < ActiveRecord::Base
	has_many :places, foreign_key: :place_type_id
	has_attached_file :icon, :url => "/system/:class/:attachment/:id/:style/:basename.:extension", :path => ":rails_root/public//maps_icons/:id.png"
	validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
end
