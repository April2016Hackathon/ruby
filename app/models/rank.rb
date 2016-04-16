class Rank < ActiveRecord::Base
	has_many :users

	#When S3 and AWS are active, uncomment the code below
	
	#has_attached_file :image, styles: { thumb: "50x50>" medium: "500x500>" },
	#	default_url: "images/:style/missing.png"
	#validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
