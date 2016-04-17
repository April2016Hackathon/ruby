class Response < ActiveRecord::Base
	belongs_to :user
	belongs_to :posting

	validates_presence_of :user_id, :posting_id


	validate :therecanonlybeone

	def therecanonlybeone
	 posting = self.posting
	 response = posting.responses.find_by(chosen: true)
	 if self.chosen && response
	 	errors.add(:chosen, "only one chosen response can be true.")
	 end
	end
end
