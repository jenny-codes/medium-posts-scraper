require 'scraper/post-scraper'

class UserLoader
  before_action :does_account_exist

  def initialize(account)
    @homepage = Nokogiri::HTML(open("https://medium.com/@#{account}/"))
  end

  # return a list of posts for a given account, in published time descending order
  def all_posts
    # posts = []
    # all_post_urls.each do |url|
    #   posts << parse_url(url)
    # end
    # posts

    all_post_urls.map { |url| parse_url(url) }
  end

  # return a list of post-urls for a given account, in published time descending order
  def all_post_urls
    # urls = []
    # @homepage.search('a h1:first-of-type').each do |title|
    #   urls << clean_url(title.ancestors('a')[0]['href'])
    # end
    # urls
    @homepage.search('a h1:first-of-type').map { |title| clean_url(title.ancestors('a')[0]['href']) }
  end


  private
    def does_account_exist
      @homepage.search('div.br').search('div.bs').each do |div|
        if div.text == 'Error'
          raise UserNotExistError
        end
      end
    end

    def clean_url(url)
      /.*(?=\?)/.match(url)[0]
    end

end