json.user do
  json.extract! @user, :user_id, :text, :title, :mood
end
