require "medium/scraper/version"
require "open-uri"

module Medium
  module Scraper
    class Error < StandardError; end
    
    # return a list of posts for a given account, in published time descending order
    def posts_by_user account
      posts = []
      post_urls_by_user(account).each do |url|
        posts << parse_url(url)
      end

    end

    # return a list of post-urls for a given account, in published time descending order
    def post_urls_by_user account
      urls = []
      homepage = Nokogiri::HTML(open("https://medium.com/@#{account}/"))
      homepage.search('a h1:first-of-type').each do |title|
        urls << clean_url(title.ancestors('a')[0]['href'])
      end
      urls
    end

    def last_post_by_user account
      parse_url(post_urls_by_user(account)[0])
    end

    # return normalized content of a given Medium post
    def parse_url url
      content     = Nokogiri::HTML(open(url)).search('div.section-inner')
      title       = content.search('h1').text
      body        = normalize(content)
      description = body.search('p').first.content 

      {
        title: title,   
        medium_url: url,          
        description: description,
        body: body
      }
    end

    def normalize post
      post.children[0..1].remove
      segments = post.children
      segments.search('figure').each { |fig| clean_img_block(fig) }
      segments.search('a em').remove
      segments
    end

    def clean_img_block figure
      img = figure.first_element_child.children.search('img')[0]
      # img['class'] = 'lazy'
      # img['data-src'] = img['src']
      # img.remove_attribute('src')
      figure.first_element_child.swap(img)
    end

    def clean_url url
      /.*(?=\?)/.match(url)[0]
    end
  end
end
