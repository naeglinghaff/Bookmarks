feature 'add comments' do
  scenario 'adds a new comment' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    visit('/bookmarks')
    first(".bookmarks").click_button("Add Comment")
    fill_in('comment', with: "this is pointless")
    click_button("Submit")
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_content "this is pointless"
  end
end
