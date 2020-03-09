feature 'bookmark display' do
  scenario 'it shows the bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("http://www.makersacademy.com this is a bookmark")
  end
end
