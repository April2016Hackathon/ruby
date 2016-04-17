json.array! @posts do |post|
	json.username post.user.username
	json.user_id post.user.id
	json.title post.title
	json.text post.text
	json.mood post.mood
	json.id post.id
	json.created_at post.created_at
end
