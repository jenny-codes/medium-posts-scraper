RSpec.describe MediumScraper do

  it "has a version number" do
    expect(Scraper::VERSION).not_to be nil
  end

  describe '#posts_by_user' do 
    let(:user) { 'jinghua.shih' }
    let(:posts) { MediumScraper.posts_by_user(user) }

    context 'when user account does not exist' do 
      it 'raises UserNotFoundError' do 
        expect { MediumScraper.posts_by_user('nonexistla')}.to raise_error(MediumScraper::UserNotFoundError)
      end
    end

    context 'when user account exists' do
      it 'returns an array' do
        expect(posts.class).to eq(Array)
      end
      it 'returns an empty array if user has no published stories' do 
        expect(MediumScraper.posts_by_user('nonexist')).to eq([])
      end
      it 'each item in array is a hash' do 
        expect(posts.first.class).to eq(Hash)
      end 
    end
  end

  describe '#post_by_url' do
    let(:url) { 'https://medium.com/@jinghua.shih/container-%E6%A6%82%E5%BF%B5%E7%AD%86%E8%A8%98-b0963ae2d7c6' }
    let(:invalid_url) { 'blah' }
    let(:post) { MediumScraper.post_by_url(url) }

    context 'when url is empty' do
      it 'returns nil' do 
        expect(MediumScraper.post_by_url('')).to be nil
      end
    end

    context 'when url is not valid' do 
      it 'raises UrlNotFoundError exception' do
        expect { MediumScraper.post_by_url(invalid_url)}.to raise_error(MediumScraper::UrlNotFoundError)
      end
    end

    context 'when url is valid' do 
      it 'returns a hash' do
        expect(post.class).to eq(Hash)
      end
    end
  end
end
