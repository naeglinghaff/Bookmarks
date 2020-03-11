require 'pg'
# this is called everytime we run our tests so we clear our test database environment
def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_tests')
  # this clears the bookmarks table
  connection.exec("TRUNCATE bookmarks;")
end
