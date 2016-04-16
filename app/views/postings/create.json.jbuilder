json.post do
   json.username @post.user.username
   json.extract! @post, :user_id, :text, :title, :mood
end
