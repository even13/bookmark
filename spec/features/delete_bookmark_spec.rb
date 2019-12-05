feature "delete bookmark" do
  scenario "bookmark is deleted and does not appear on screen" do
    clear_database
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    visit '/bookmarks'
    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")

    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Makers", href: "http://www.makersacademy.com")
  end
end
