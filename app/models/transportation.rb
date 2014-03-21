class Transportation < ActiveRecord::Base
	has_many :ways, foreign_key: :transportation_id
end
