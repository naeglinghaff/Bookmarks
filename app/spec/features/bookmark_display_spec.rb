# frozen_string_literal: true

feature 'bookmark display' do
  scenario 'it shows the bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_tests')
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')
    expect(page).to have_content('http://www.makersacademy.com')
  end
end
