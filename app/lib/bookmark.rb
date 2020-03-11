# frozen_string_literal: true
require 'pg'
class Bookmark
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
    # maps the output
    result.map { |bookmark| bookmark['url'] }
  end

# class method to create new bookmarks
  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_tests')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
      connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
  end
end
