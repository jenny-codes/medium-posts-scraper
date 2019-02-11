module MediumScraper
  class UrlNotFoundError < StandardError
    def initialize
      return 'Url not found.'
      # super('Url not found.')
    end
  end

  class UserNotFoundError < StandardError
    def initialize
      p 'User not found.'
      #super('User not found.')
    end
  end
end