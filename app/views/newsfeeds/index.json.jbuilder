json.array!(@newsfeeds) do |newsfeed|
  json.extract! newsfeed, :id, :name, :url, :comment
  json.url newsfeed_url(newsfeed, format: :json)
end
