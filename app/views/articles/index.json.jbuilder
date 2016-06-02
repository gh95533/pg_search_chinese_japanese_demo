json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :guid, :source, :lang
  json.url article_url(article, format: :json)
end
