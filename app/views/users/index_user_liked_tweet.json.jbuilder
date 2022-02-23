json.posts @posts do |post|
  json.partial! 'posts/post', post: post

  json.app_user do
    json.partial! 'user', user: post.user
  end
end