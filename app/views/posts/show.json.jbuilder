json.post do
  json.partial! 'post', post: @post

  json.app_user { json.partial! 'users/user', user: @post.user }

  json.comments @post.comments do |comment|
    json.partial! 'comments/comment', comment: comment
  end
end
