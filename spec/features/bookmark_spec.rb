require 'bookmark'

describe Bookmark do

  it "returns the list of bookmarks" do
    con = PG.connect(dbname: 'bookmark_manager_test')
    con.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
    con.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")
    con.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com', 'Destroy All Software');")
    bookmarks = Bookmark.all
    expect(bookmarks[0].title).to include('Makers Academy')
    expect(bookmarks[1].title).to include('Google')
    expect(bookmarks[2].title).to include('Destroy All Software')
  end

  describe '#create' do
    it "adds a new bookmark to bookmarks list" do
      Bookmark.create(url: 'http://www.facebook.com/', title: 'Facebook')
      expect(Bookmark.all[0].title).to include('Facebook')
    end
  end

end
