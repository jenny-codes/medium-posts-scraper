require 'thor'
require 'medium-scraper'

module MediumScraper
  class CLI < Thor
    desc "user USER", "Returns a list of posts by this user account"
    def user(user)
      puts MediumScraper::posts_by_user(user)
    end

    desc "url URL", "Returns content for a Medium post by its url"
    def url(url)
      puts MediumScraper::post_by_url(url)
    end
  end
end