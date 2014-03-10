json.array!(@feeds) do |feed|
  json.extract! feed, :id, :kind, :name, :url, :comment
  json.url feed_url(feed, format: :json)
end
