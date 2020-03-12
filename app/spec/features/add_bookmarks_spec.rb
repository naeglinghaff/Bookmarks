feature 'adding a bookmark' do
  scenario 'user adds bookmark to bookmark manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://thisisabookmark.com')
    fill_in('title', with: 'This is a test bookmark')
    click_button('Submit')

    expect(page).to have_link('This is a test bookmark', href: 'http://thisisabookmark.com')
  end

  scenario 'the bookmark must be valid' do
    visit('/bookmarks/new')
    fill_in('title', with: 'not a real title')
    fill_in('url', with: 'not a url' )
    click_button('Submit')

    expect(page).not_to have_content 'not a real title'
    expect(page).not_to have_content 'You must submit a valid URL.'
  end
end
