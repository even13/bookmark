require 'bookmark'

describe Bookmark do

  describe ".all" do

    it "should display all my bookmarks" do
      clear_database
      connection = PG.connect( dbname: 'bookmark_manager_test' )
      connection.exec("INSERT INTO bookmarks(url) VALUES('http://www.makersacademy.com'),('http://www.destroyallsoftware.com'),('http://www.google.com');")

      bookmarks = Bookmark.all

      p bookmarks
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      clear_database
      Bookmark.create("http://www.testbookmark.com")

      expect(Bookmark.all).to include("http://www.testbookmark.com")
    end
  end

end
