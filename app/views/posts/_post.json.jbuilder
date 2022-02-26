json.id post.id
json.uuid post.uuid
json.body post.body
json.image get_file_url(post.image, height: 300, crop: 'fill')
json.reply_status post.reply_status
json.created_at post.created_at

json.meta do
  json.is_favourited current_user.favourited?(post)

  json.likes do
    json.total_likes post.votes_for.size
    json.is_liked current_user.voted_up_on?(post)
  end

  json.thumbs_up do
    json.total_thumbs_up post.votes_for.size
    json.is_thumbed_up current_user.voted_up_on?(post)
  end

  json.smiles do
    json.total_smiles post.votes_for.size
    json.is_smiled current_user.voted_up_on?(post)
  end

  json.comments { json.total_comments post.comments.size }

  json.reposts do
    json.total_reposts post.reposts.count
    json.reposts_count post.reposts.reposts_count
    json.quote_posts_count post.reposts.quote_posts_count
    json.is_reposted current_user.already_reposted?(post)
  end
end
