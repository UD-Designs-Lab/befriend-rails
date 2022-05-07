json.posts @posts do |post|
  json.partial! "posts/post", post: post

  json.app_user { json.partial! "user", user: post.user }
end
