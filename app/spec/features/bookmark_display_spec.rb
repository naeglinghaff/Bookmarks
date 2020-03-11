# frozen_string_literal: true

feature 'bookmark display' do
  scenario 'it shows the bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_tests')
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')

    visit('/bookmarks')
    expect(page).to have_link('Makers', href:'http://www.makersacademy.com')
  end
end
