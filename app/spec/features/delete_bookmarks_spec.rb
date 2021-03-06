feature 'delete bookmarks' do
  scenario 'removes bookmarks from database' do

    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')

    visit('/bookmarks')
    click_button("Delete")

    expect(page).to_not have_link("http://www.makersacademy.com")
  end
end
