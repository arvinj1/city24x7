json.array!(@ad_items) do |ad_item|
  json.extract! ad_item, :id, :name, :image, :selected, :ad_banner_id
  json.url ad_item_url(ad_item, format: :json)
end
