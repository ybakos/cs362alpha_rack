ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative '../main.rb'
require_relative '../album.rb'

class TopAlbumsAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    @albums = TopAlbumsApp.new
  end

  def test_sort_by_album_year
    get '/year'
    assert last_response.ok?
    assert_equal @albums.at(0).year, 1959
  end

   def test_sort_album_title_alphabetically
    get '/title'
    assert last_response.ok?
    flunk
  end

  def test_sort_by_album_title_length
    get '/titleLength'
    assert last_response.ok?
    flunk
  end
  
  def test_sort_by_album_rank
    get '/rank'
    assert last_response.ok?
    flunk
  end

end