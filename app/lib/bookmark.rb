# frozen_string_literal: true
require 'pg'
class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    # saves the connection object created by the PG object to a variable
    # this provides the link to our test database
      connection = PG.connect(dbname: 'bookmark_manager_tests')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    # this send the SQL query we want to the database and should return our strings
    result = connection.exec('SELECT * FROM bookmarks;')
    # maps the result object from the database to new instances of the bookmark class
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

# class method to create new bookmarks
  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_tests')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
      # puts it into the database and returns our table columns
      result = connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
      # creates a new bookmark with what is in the returned values
      Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_tests')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end
end
