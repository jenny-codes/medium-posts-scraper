require "open-uri"
require 'nokogiri'
require 'scraper/errors'

class PostScraper
  class << self
    def parse(url)
      return nil if url.empty?

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

    rescue StandardError
      raise MediumScraper::UrlNotFoundError
    end

    def normalize(post)
      post.children[0..1].remove
      segments = post.children
      segments.search('figure').each { |fig| clean_img_block(fig) }
      segments.search('a em').remove
      segments
    end

    def clean_img_block(figure)
      img = figure.first_element_child.children.search('img')[0]
      figure.first_element_child.swap(img)
    end
  end
end
