require 'scraper/version'
require 'scraper/user-loader'
require 'scraper/post-scraper'

class MediumScraper

  def posts_by_user(account, **opts)
    posts = UserLoader.new(account).all_posts

    if opts['order'] == 'published_asc'
      posts = posts.reverse
    end

    if opts['count']
      posts = posts.first(opts['count'].to_i)
    end

    posts
  end

  def post_by_url(url)
    PostScraper.parse(url)
  end
end

