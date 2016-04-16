class Posting < ActiveRecord::Base
	belongs_to :user
	has_many :responses

	validates_presence_of :user_id
end
