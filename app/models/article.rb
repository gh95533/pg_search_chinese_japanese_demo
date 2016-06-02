class Article < ActiveRecord::Base
  validates :guid, uniqueness: true

  include PgSearch

  pg_search_scope :chinese_search,
                  :against => [:title, :content],
                  :using => {
                      tsearch: {
                          dictionary: 'zhcnsearch'
                      }
                  }

  pg_search_scope :english_search,
                  :against => [:title, :content],
                  :using => {
                      tsearch: {
                          dictionary: 'english'
                      }
                  }

  pg_search_scope :japanese_search,
                  :against => [:title, :content],
                  :using => {
                      tsearch: {
                          dictionary: 'japanese'
                      }
                  }

end
