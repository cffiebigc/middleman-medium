# Require core library
require 'middleman-core'

# Extension namespace
class MediumExtension < ::Middleman::Extension
  option :source, 'https://blog.continuum.cl/feed', 'https://medium.com/feed/your-account'
  expose_to_template :fetch_medium_posts

  def initialize(app, options_hash={}, &block)
    super
    require 'rss'
    puts options.source
  end

  def fetch_medium_posts
    rss_results = []
    rss = RSS::Parser.parse(open(options.source).read, false).items
    rss.each do |result|
      document = Nokogiri::HTML.fragment(result.content_encoded)
      img = document&.search('img')&.first['src'] || 'https://picsum.photos/300/200?image=579'
      result = { title: result.title, date: result.pubDate, link: result.link, category: result&.category&.content, img: img }
      rss_results.push(result)
    end
    rss_results
  end

  # A Sitemap Manipulator
  # def manipulate_resource_list(resources)
  # end

  # helpers do
  #   def a_helper
  #   end
  # end
end