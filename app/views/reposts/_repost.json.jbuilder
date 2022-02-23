json.partial! 'reposts/repost_min', repost: repost

json.reposter do
  json.partial! 'users/user', user: repost.user
end

json.repostable do
  if repost.repostable_type == 'post'
    json.partial! 'posts/post', post: repost.repostable

    json.app_user do
      json.partial! 'users/user', user: repost.repostable.user
    end
  elsif repost.repostable_type == 'Repost'
    json.partial! 'reposts/repost_min', repost: repost.repostable

    json.nested_post do
      json.partial! 'reposts/repost_min', repost: repost.repostable.repostable

      json.app_user do
        json.partial! 'users/user', user: repost.repostable.repostable.user
      end
    end

    json.app_user do
      json.partial! 'users/user', user: repost.repostable.user
    end
  end
end