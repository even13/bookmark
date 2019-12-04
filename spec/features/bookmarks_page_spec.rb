feature "Bookmarks" do

  scenario "shows my bookmarks" do
    clear_database
    connection = PG.connect( dbname: 'bookmark_manager_test' )
    connection.exec("INSERT INTO bookmarks(url) VALUES('http://www.makersacademy.com'),('http://www.destroyallsoftware.com'),('http://www.google.com');")

    visit '/bookmarks'
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com")
  end

end
