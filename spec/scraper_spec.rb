RSpec.describe MediumScraper do

  it "has a version number" do
    expect(Scraper::VERSION).not_to be nil
  end

  let(:scraper) { MediumScraper.new }
  let(:user) { 'jinghua.shih' }
  let(:url) { 'https://medium.com/@jinghua.shih/container-%E6%A6%82%E5%BF%B5%E7%AD%86%E8%A8%98-b0963ae2d7c6' }

  describe '#posts_by_user' do 
    # context 'user account does not exist' do 
    #   it 'raises exception' do 
    #     expect(scraper.posts_by_user('nonexistla')).to raise_error(OpenURI::HTTPError)
    #   end
    # end
    context 'user account exist' do
      let(:posts) { scraper.posts_by_user(user) }

      it 'returns an array' do
        expect(posts.class).to eq(Array)
      end

      it 'returns an empty array if user has no published stories' do 
        expect(scraper.posts_by_user('nonexist')).to eq([])
      end

      it 'each item in array is a hash' do 
        expect(posts.first.class).to eq(Hash)
      end 
    end
  end
end
