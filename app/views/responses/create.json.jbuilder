json.response do
	json.username @response.user.username
	json.extract! @response, :user_id, :posting_id, :text, :chosen
end
