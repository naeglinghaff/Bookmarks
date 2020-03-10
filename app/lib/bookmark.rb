require 'pg'
class Bookmark
  def self.all
    # saves the connection object created by the PG object to a variable
    # this provides the link to our database
    connection = PG.connect(dbname: 'bookmark_manager')
    # this send the SQL query we want to the database and should return our strings
    result = connection.exec("SELECT * FROM bookmarks;")
    # maps the output
    result.map { |bookmark| bookmark['url'] }
  end
end
