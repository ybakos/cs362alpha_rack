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
    @allOfTheAlbums = Array.new
    File.open("top_100_albums.txt", "r") do |file|
      albums = file.readlines
    end
    @allOfTheAlbums = albums.makeAlbums
  end

  def call(env) 
    #Placeholder for rendering
    ['200', {'Content-Type' => 'text/html'}, [albums.to_s]]
  end

  def makeAlbums
    albums.map.with_index do |i, j| 
      album = Album.new
      albumProperties = albums.split(',')
      album.rank = j + 1
      album.title = albumProperties[0]
      album.year = albumProperties[1]
      allOfTheAlbums << album
  end
  #design pattern front controller for call method

  def render()
    ERB.new(index.html.erb).result(binding)
  end

end

#Rack::Handler::WEBrick.run(TopAlbumsApp.new)


