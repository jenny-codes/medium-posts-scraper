require 'thor'
module MediumScraper
  class CLI < Thor
    desc "user USER", "Returns a list of posts by this user account"
    def user(user)
      MediumScraper.posts_by_user(user)
    end

    desc "url URL", "Returns content for a Medium post by its url"
    def url(url)
      MediumScraper.post_by_url(url)
    end
  end
end