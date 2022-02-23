json.id comment.id
json.body comment.content
json.created_at comment.created_at
json.has_nested_comment !comment.comments.length.zero?

json.commenter do
  json.partial! 'users/user', user: comment.user
end

json.meta do
  json.is_favourited current_user.favourited?(comment)

  json.likes do
    json.total_likes comment.votes_for.size
    json.is_liked current_user.voted_up_on?(comment)
  end

  json.thumbs_up do 
    json.total_thumbs_up comment.votes_for.size
    json.is_thumbed_up current_user.voted_up_on?(comment)
  end

  json.smiles do
    json.total_smiles comment.votes_for.size
    json.is_smiled current_user.voted_up_on?(comment)
  end

  json.comments do
    json.total_comments comment.comments.size
  end
end

json.comments comment.comments do |comment|
  json.partial! 'comments/comment', comment: comment
end