feature 'bookmark display' do
  scenario 'it shows the bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("This is a bookmark\nThis is also a bookmark")
  end
end
