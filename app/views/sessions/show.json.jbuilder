json.user { json.partial! "users/user", user: @current_user }

json.token @token
