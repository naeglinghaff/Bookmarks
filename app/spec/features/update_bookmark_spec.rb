feature 'update bookmark' do
  scenario 'updates an existing bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_tests')
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')

    visit('/bookmarks')
    click_button("Edit")
    fill_in('url', with: 'http://thisisabookmark.com')
    fill_in('title', with: 'This is a test bookmark')
    click_button("Submit")
    
    expect(page).to have_link('This is a test bookmark', href: 'http://thisisabookmark.com')
  end
end
