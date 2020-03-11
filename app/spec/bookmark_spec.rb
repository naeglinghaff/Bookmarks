# frozen_string_literal: true

require 'bookmark'

describe Bookmark do

  describe '.all' do
    it 'returns bookmarks' do
      # adding the test data to the test database
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      data = PG.connect(dbname: 'bookmark_manager_tests').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq data.first['id']
      expect(bookmark.title).to eq 'Makers'
      expect(bookmark.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'www.hello.com', title: "this is a test")

      expect(bookmark.url).to eq 'www.hello.com'
      expect(bookmark.title).to eq "this is a test"
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'www.hello.com', title: "this is a test")
      bookmark_id = bookmark.id
      Bookmark.delete(id: bookmark_id)
      expect(Bookmark.all.length).to eq 0
    end
  end
end
