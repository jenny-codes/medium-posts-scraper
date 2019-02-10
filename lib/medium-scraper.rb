require 'scraper/version'
require 'scraper/user-loader'
require 'scraper/post-scraper'

class MediumScraper
  # attr_reader :posts, :urls, :post

    def posts_by_user(account)
      PostScraper.posts_by_user(account)
    end

    def post_urls_by_user(account)
      'posts_urlby_user'
    end

    def post_by_url(url)
      'post_by_url'
    end
end

