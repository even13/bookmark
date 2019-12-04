feature "Add new bookmark" do
  scenario "should allow you to submit new urls" do
    visit '/bookmarks/new'
    fill_in 'url', with: "https://github.com/"
    click_on 'Submit'
    expect(page).to have_content("https://github.com/")
  end
end
