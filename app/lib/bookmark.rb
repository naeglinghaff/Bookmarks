# frozen_string_literal: true
require 'pg'
require 'uri'
require_relative './databaseconnection'
require './spec/database_helpers'
require_relative './tag'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks;')
    # maps the result object from the database to new instances of the bookmark class
    result.map do |bookmark|
      Bookmark.new(
        id: bookmark['id'],
        title: bookmark['title'],
        url: bookmark['url']
      )
    end
  end

# class method to create new bookmarks
  def self.create(url:, title:)
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
    # creates a new bookmark with what is in the returned values
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    return false unless is_url?(url)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = '#{id}';")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def comments
     DatabaseConnection.query("select * from comments where bookmark_id = '#{id}';")
  end

  def self.where(tag_id:)
    result = DatabaseConnection.query("SELECT id, title, url FROM bookmark_tags INNER JOIN bookmarks ON bookmarks.id = bookmark_tags.bookmark_id WHERE bookmark_tags.tag_id = '#{tag_id}';")
  end

  def tags(tag_class = Tag)
    tag_class.where(bookmark_id: id)
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
