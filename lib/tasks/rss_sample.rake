namespace :rss_sample do

  task feeds: [:environment] do

    rss_sample_cn = Rails.configuration.rssfeeds['rss_sample_cn']
    rss_sample_ja = Rails.configuration.rssfeeds['rss_sample_ja']
    rss_sample_en = Rails.configuration.rssfeeds['rss_sample_en']

    if rss_sample_cn.present?
      puts rss_sample_cn
      import_rss_to_articles(rss_sample_cn, 'cn')
    end

    if rss_sample_en.present?
      puts rss_sample_en
      import_rss_to_articles(rss_sample_en, 'en')
    end

    if rss_sample_ja.present?
      puts rss_sample_ja
      import_rss_to_articles(rss_sample_ja, 'ja')
    end

  end


  def import_rss_to_articles(rss_url, lang)
    begin
      # fetch demo articles by rss feeds
      content = Feedjira::Feed.fetch_and_parse rss_url
      content.entries.each do |entry|
        article = Article.new
        article.guid = entry.url.strip if entry.url.present?
        article.title = entry.title.strip if entry.title.present?
        article.content = entry.summary.strip if entry.summary.present?
        article.lang = lang if lang.present?
        article.save
      end

    rescue => e
      puts e.inspect
      # do nothing
    end
  end
end
