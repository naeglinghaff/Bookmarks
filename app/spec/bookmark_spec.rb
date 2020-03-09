require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("this is a bookmark")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
