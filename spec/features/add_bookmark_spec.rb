feature "Add new bookmark" do
  scenario "should allow you to submit new urls" do
    visit '/bookmarks/new'
    fill_in 'url', with: "https://github.com/"
    fill_in 'title', with: "Github"
    click_on 'Submit'
    expect(page).to have_link("Github", href: "https://github.com/")
  end
end
