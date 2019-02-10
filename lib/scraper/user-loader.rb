require 'scraper/post-scraper'

class UserLoader
  def initialize(account)
    @homepage = Nokogiri::HTML(open("https://medium.com/@#{account}/"))
    raise UserNotExistError if not account_exists
  end

  def all_posts
    all_post_urls.map { |url| PostScraper.parse(url) }
  end

  def all_post_urls
    @homepage.search('a h1:first-of-type').map { |title| clean_url(title.ancestors('a')[0]['href']) }
  end

  private
    def account_exists
      @homepage.search('div.br').search('div.bs').each do |div|
        if div.text == 'Error'
          return false
        end
      end
      return true
    end

    def clean_url(url)
      /.*(?=\?)/.match(url)[0]
    end

end