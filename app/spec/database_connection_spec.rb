require 'databaseconnection'

describe DatabaseConnection do

  describe '.setup' do
    it 'should take one parameter' do
      expect(described_class).to respond_to(:setup).with(1).arguments
    end
# test to see if pg can connect via this class method
    it 'sets up a database connection through PG' do
     expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

     DatabaseConnection.setup('bookmark_manager_test')
   end

# test to see that the connection sticks around
    it 'should stay connected' do
      connection = DatabaseConnection.setup('bookmark_manager_tests')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'should take one parameter' do
      expect(described_class).to respond_to(:query).with(1).arguments
    end
  end

    it 'should accept a sql string' do
      DatabaseConnection.setup('bookmark_manager_tests')
      expect(DatabaseConnection.connection).to receive(:exec).with('SELECT * FROM bookmarks')
      DatabaseConnection.query('SELECT * FROM bookmarks')
  end
end
