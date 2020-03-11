feature 'adding a bookmark' do
  scenario 'user adds bookmark to bookmark manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://thisisabookmark.com')
    fill_in('title', with: 'This is a test bookmark')
    click_button('Submit')

    expect(page).to have_link('This is a test bookmark', href: 'http://thisisabookmark.com')
  end
end
