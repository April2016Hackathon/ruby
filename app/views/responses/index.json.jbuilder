json.array! @responses do |response|
	json.user response.user.username
	json.user_id response.user_id
	json.posting_id response.posting_id
	json.text response.text
	json.chosen response.chosen
	json.created_at response.created_at
end