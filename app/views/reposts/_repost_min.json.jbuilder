json.id repost.id
json.body repost.body
json.created_at repost.created_at

json.meta do
  json.is_favourited current_user.favourited?(repost)

  json.likes do
    json.total_likes repost.votes_for.size
    json.is_liked current_user.voted_up_on?(repost)
  end

  json.thumbs_up do 
    json.total_thumbs_up post.votes_for.size
    json.is_thumbed_up current_user.voted_up_on?(post)
  end

  json.smiles do
    json.total_smiles post.votes_for.size
    json.is_smiled current_user.voted_up_on?(post)
  end

  json.comments do
    json.total_comments repost.comments.count
  end

  json.reposts do
    json.total_reposts repost.reposts.count
    json.is_reposted current_user.already_reposted?(repost)
  end
end