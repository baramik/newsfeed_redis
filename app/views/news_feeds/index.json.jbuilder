json.array!(@news_feeds) do |news_feed|
  json.extract! news_feed, :id, :title, :text
  json.url news_feed_url(news_feed, format: :json)
end
