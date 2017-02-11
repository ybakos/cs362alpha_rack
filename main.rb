require 'rack'
require 'erb'

class  Album

  attr_accessor
  attr_reader(:rank, :title, :year)

  def initialize(rank, title, year)
    @rank = rank
    @title = title
    @year = year
  end

end

class TopAlbumsApp
  
  include ERB::Util

  def initialize
    @albums = Array.new
    @allOfTheAlbums = Array.new
    File.open("top_100_albums.txt", "r") do |file|
      @albums = file.readlines
    end
    @allOfTheAlbums = makeAlbums(@albums)
  end

  def call(env) 
    #Placeholder for rendering

    ['200', {'Content-Type' => 'text/html'}, [render]]
  end

  def makeAlbums(albums)
    albums.map.with_index do |albumInfo, rank| 
      albumProperties = albumInfo.split(',')
      album = Album.new(rank + 1, albumProperties[0], albumProperties[1])
      @allOfTheAlbums[rank] = album
    end
  end
  #design pattern front controller for call method

  def render
    raw = File.read("index.html.erb")
    ERB.new(raw).result(binding)
  end

  def sortYear
    @allOfTheAlbums.sort_by! {|album| album.year}
  end 

  def sortTitle
    @allOfTheAlbums.sort_by! {|album| album.title}
  end 

  def sortRank
    @allOfTheAlbums.sort_by! {|album| album.rank}
  end 
  
  def sortLength
    @allOfTheAlbums.sort_by! {|album| album.title.length}
  end 

end

#Rack::Handler::WEBrick.run(TopAlbumsApp.new)


