json.posts @posts do |post|
  json.partial! "post", post: post

  json.app_user { json.partial! "users/user", user: post.user }
end
