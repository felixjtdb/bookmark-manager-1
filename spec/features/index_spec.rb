feature "index page" do
  scenario "user can visit the index page" do
    visit '/'
    expect(page).to have_content "Bookmark Manager"
  end
  
  scenario "user can click button to list bookmarks" do
    visit '/'
    click_button "View Bookmarks"
    expect(page).to have_current_path('/bookmarks')
  end
end
