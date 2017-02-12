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
    @albums = Array.new
    @allOfTheAlbums = Array.new # See my comment in GH about this.
    File.open("top_100_albums.txt", "r") do |file|
      @albums = file.readlines
    end
    @allOfTheAlbums = makeAlbums(@albums)
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

  def makeAlbums(albums)
    albums.map.with_index do |albumInfo, rank|
      albumProperties = albumInfo.split(',')
      album = Album.new(rank + 1, albumProperties[0], albumProperties[1])
      @allOfTheAlbums[rank] = album
    end
  end

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
