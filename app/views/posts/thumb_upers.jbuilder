json.users @thumbed_upers do |user|
    json.partial! 'users/user', user: user
  end