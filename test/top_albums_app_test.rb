require 'minitest/autorun'
require 'rack/test'
require_relative '../main'

class TopAlbumsAppTest < Minitest::Test
  include Rack::Test::Methods
  
  def setup
#  	@albums = makeAlbums(@album_data)
# 	@album = Album.new(RANK, TITLE, YEAR)
    @TopAlbumsApp = TopAlbumsApp.new
    @albums = makeAlbums(@album_data)
  end

  def test_sort_by_year
 
    get '/orderByYear'
    assert last_response.ok?
    puts @rankedAlbums
    assert_equal("Kind of Blue", @rankedAlbums.at(0).name)
  end

   def test_sort_alphabetically

    get '/orderAlphabetically'
    assert last_response.ok?
    assert_equal("'Live' at The Apollo", @rankedAlbums.at(0).name)
  end

def test_sort_by_album_title_length

    get '/orderByAlbumNameLength'
    assert last_response.ok?
    assert_equal("Ten", @rankedAlbums.at(0).name)
  end
  
end