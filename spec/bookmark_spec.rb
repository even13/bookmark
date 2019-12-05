require 'bookmark'

describe Bookmark do

  describe ".all" do

    it "should display all my bookmarks" do
      clear_database
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_instance_of Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Makers"
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      clear_database
      bookmark = Bookmark.create( url: "http://www.testbookmark.com", title: "test bookmark" )

      expect(bookmark.url).to eq "http://www.testbookmark.com"
      expect(bookmark.title).to eq "test bookmark"
      expect(bookmark).to be_instance_of Bookmark
    end

    it "fails if URL doesn't start with http or https" do
      clear_database

      expect { Bookmark.create( url: "www.testbookmark.com", title: "test bookmark" ) }.to raise_error("Invalid URL - http:// or https:// required")
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      clear_database
      bookmark = Bookmark.create( url: "http://www.testbookmark.com", title: "test bookmark" )
      Bookmark.delete( id: bookmark.id )
      bookmarks = Bookmark.all

      expect(bookmarks).to be_empty
    end
  end

end
