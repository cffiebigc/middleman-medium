# Require core library
require 'middleman-core'

# Extension namespace
class MediumExtension < ::Middleman::Extension
  option :source, 'https://blog.continuum.cl/feed', 'https://medium.com/feed/your-account'
  expose_to_template :fetch_medium_posts

  def initialize(app, options_hash={}, &block)
    super
    require 'rss'
    require 'nokogiri'
  end

  def fetch_medium_posts
    medium_rss_parser(open(options.source).read)
  end

  def medium_rss_parser(feed)
    posts = []
    rss = RSS::Parser.parse(feed, false).items
    rss.each do |item|
      posts.push(rss_item_to_hash(item))
    end
    posts
  end

  def rss_item_to_hash(item)
    document = Nokogiri::HTML.fragment(item.content_encoded)
    {
      title: item.title,
      date: item.pubDate,
      url: item.link,
      category: item&.category&.content,
      img: document&.search('img')&.first['src']
    }
  end
end