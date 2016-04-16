json.post do
   json.username @post.user.username
end
json.extract! @response, :user_id, :text, :chosen
