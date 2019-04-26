require 'pg'

class Bookmark

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => "bookmark_manager_test"
    else
      con = PG.connect :dbname => "bookmark_manager"
    end

    results = con.exec "SELECT * FROM bookmarks"
    results.map { |row| Bookmark.new(row['id'], row['url'], row['title']) }
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => "bookmark_manager_test"
    else
      con = PG.connect :dbname => "bookmark_manager"
    end
      con.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')")
  end

end
