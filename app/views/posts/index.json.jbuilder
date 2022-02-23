json.posts @posts do |post|
  json.partial! 'post', post: post

  json.app_user do
    json.partial! 'users/user', user: post.user
  end
end