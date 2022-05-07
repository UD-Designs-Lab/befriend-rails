json.favourites @favourites do |favourite|
  json.partial! "favourite", favourite: favourite
end
