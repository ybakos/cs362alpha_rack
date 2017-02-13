require 'rack'

class  Album

  attr_reader :rank, :title, :year 

  def initialize(rank, title, year)
    @rank = rank
    @title = title
    @year = year
  end
end

class TopAlbumsApp
  def initialize
    @album_data = Array.new
    @albums = Array.new
    File.open("top_100_albums.txt", "r") do |file|
      @album_data = file.readlines
    end
    @albums = makeAlbums(@album_data)
  end

  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    if request.path_info =='/year'
      response = sortYear
      ['200', {'Content-Type' => 'text/html'}, [render]]

    elsif request.path_info =='/title'
      response = sortTitle
      ['200', {'Content-Type' => 'text/html'}, [render]]

    elsif request.path_info =='/rank'
      response = sortRank
      ['200', {'Content-Type' => 'text/html'}, [render]]

    elsif request.path_info =='/titleLength'
      response = sortLength
      ['200', {'Content-Type' => 'text/html'}, [render]]

    else
      ['200', {'Content-Type' => 'text/html'}, [render]]
    end
  end

  def makeAlbums(album_data)
    album_data.map.with_index do |albumInfo, rank|
      albumProperties = albumInfo.split(',')
      album = Album.new(rank + 1, albumProperties[0], albumProperties[1])
      @albums[rank] = album
    end
  end

  def render
    raw = File.read("index.html.erb")
    ERB.new(raw).result(binding)
  end

  def sortYear
    @albums.sort_by! {|album| album.year}
  end

  def sortTitle
    @albums.sort_by! {|album| album.title}
  end

  def sortRank
    @albums.sort_by! {|album| album.rank}
  end

  def sortLength
    @albums.sort_by! {|album| album.title.length}
  end

  def isValid
    @albums.each { |album| refute album.rank > 0 && refute album.rank < 101}
  end


end
