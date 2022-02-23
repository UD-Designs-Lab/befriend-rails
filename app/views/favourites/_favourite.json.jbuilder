json.type favourite.favouriteable_type
json.favourite_id favourite.id

if favourite.favouriteable_type == 'post'
  json.partial! 'posts/post', post: favourite.favouriteable

  json.app_user do
    json.partial! 'users/user', user: favourite.favouriteable.user
  end
elsif favourite.favouriteable_type == 'Comment'
  json.partial! 'comments/comment', comment: favourite.favouriteable
  # favourites should not have nested comments and should only display if favourited explicitly
  json.has_nested_comment false
  json.comments []
else
  json.partial! 'reposts/repost', repost: favourite.favouriteable
end