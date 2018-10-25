require 'pg'
require 'pry'

class Bookmark
  attr_reader :id, :title, :url, :database

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    set_database_connection
    @database.exec('SELECT * from bookmarks;').map do |bookmark|
      Bookmark.new(bookmark['id'].to_i, bookmark['title'], bookmark['url'])
    end
  end

  def self.create(title, url)
    set_database_connection
    result = @database.exec("INSERT INTO bookmarks(title,url) VALUES('#{title}','#{url}') RETURNING id, url, title;")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.delete(id)
    set_database_connection
    @database.exec("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.update(id, title, url)
    set_database_connection
    result = @database.exec("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = #{id} RETURNING id, url, title;" )
  end

  def self.find(id)
    set_database_connection
    result = @database.exec("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.set_database_connection
    if ENV['ENVIRONMENT'] == "test"
      @database = PG.connect(dbname: 'bookmark_manager_test')
    else
      @database = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
