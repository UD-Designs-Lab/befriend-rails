json.users @smilers do |user|
    json.partial! 'users/user', user: user
  end