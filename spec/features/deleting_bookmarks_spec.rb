feature 'deleting a bookmark' do
  scenario 'delete a bookmark' do
    Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    visit '/bookmarks'
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
