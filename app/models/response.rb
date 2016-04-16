class Response < ActiveRecord::Base
	belongs_to :user
	belongs_to :posting

	validates_presence_of :user_id, :posting_id
end
