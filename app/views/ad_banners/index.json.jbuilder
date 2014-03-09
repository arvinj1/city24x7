json.array!(@ad_banners) do |ad_banner|
  json.extract! ad_banner, :id, :name, :counter, :selected, :see
  json.url ad_banner_url(ad_banner, format: :json)
end
