feature 'adding a bookmark' do
  scenario 'user adds bookmark to bookmark manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://thisisabookmark.com')
    click_button('Submit')

    expect(page).to have_content 'http://thisisabookmark.com'
  end
end
