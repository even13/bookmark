require 'pg'

class Bookmark

  attr_reader :url, :title, :id

  def initialize(url: , title: , id:)
    @url= url
    @title = title
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end

    result = connection.exec( "SELECT * FROM bookmarks;" )

    result.map do |bookmark|
      Bookmark.new(url: bookmark['url'], title: bookmark['title'], id: bookmark['id'])
    end

  end

  def self.create(url:, title:)
    raise "Invalid URL - http:// or https:// required" unless url.start_with?('http://', 'https://')
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end

    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")

    Bookmark.new(url: result[0]['url'], title: result[0]['title'], id: result[0]['id'])
  end

end
