require './lib/databaseconnection'

  if ENV['ENVIRONMENT'] == 'test'
    # saves the connection object created by the PG object to a variable
    # this provides the link to our test database
    DatabaseConnection.setup('bookmark_manager_tests')
  else
    DatabaseConnection.setup('bookmark_manager')
  end
