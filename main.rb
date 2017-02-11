require 'rack'


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

  def call(env) 
    albums = []
    File.open("top_100_albums.txt", "r") do |file|
      albums = file.readlines
    end

    ['200', {'Content-Type' => 'text/html'}, [albums.to_s]]
  end
  #design pattern front controller for call method

  def render()
    ERB.new(@template).result(binding)
  end

end

#Rack::Handler::WEBrick.run(TopAlbumsApp.new)


