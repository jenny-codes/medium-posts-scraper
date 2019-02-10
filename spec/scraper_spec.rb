RSpec.describe MediumScraper do
  before(:each) do
      @scraper = MediumScraper.new
      @url = 'https://medium.com/@jinghua.shih/container-%E6%A6%82%E5%BF%B5%E7%AD%86%E8%A8%98-b0963ae2d7c6'
  end
  
  it "has a version number" do
    expect(Scraper::VERSION).not_to be nil
  end

  it "returns something with parse_url" do
    expect(@scraper.post_by_url(@url)).not_to eq(nil)
  end
end
