json.id user.id
json.username user.username
json.email user.email
json.name user.name || "Love Dore"
json.bio user.bio || "I am happy to be part of the befrienders!!"
json.location user.location
json.website user.website
json.avatar get_file_url(
  user.avatar,
  width: 200,
  height: 200,
  gravity: "face",
  crop: "thumb"
)
json.banner get_file_url(user.banner, height: 192)
json.created_at user.created_at

json.includes do
  json.follow_stat do
    json.followers_count user.followers.count
    json.following_count user.following.count

    json.is_following current_user.following?(user) if user_signed_in?
    json.is_followed user.following?(current_user) if user_signed_in?
  end
end
