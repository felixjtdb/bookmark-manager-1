require 'pry'
feature 'deleting/updating a bookmark' do

  scenario 'delete a bookmark' do
    Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    visit '/bookmarks'
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end

  scenario 'update a bookmark' do
    bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    visit '/bookmarks'
    first('.bookmark').click_button 'Update'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"
    fill_in :url, with: 'http://www.shakersacademy.com'
    fill_in :title, with: 'Shakers Academy'
    click_button 'Submit'
    expect(current_path).to eq "/bookmarks"
    expect(page).to have_link('Shakers Academy', href: 'http://www.shakersacademy.com')
  end
end
