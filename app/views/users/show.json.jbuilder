json.user do
  json.partial! 'user', user: @user

  json.posts @user.posts do |post|
    json.partial! 'posts/post', post: post
  end
end
