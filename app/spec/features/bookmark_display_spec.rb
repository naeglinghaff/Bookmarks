feature 'bookmark display' do
  scenario 'it shows the bookmarks' do
    visit('/')
    expect(page).to have_content("Bookmarks")
  end
end
