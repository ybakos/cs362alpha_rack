require 'minitest/autorun'
require_relative '../main.rb'
require_relative '../album.rb'

class TopAlbumsAppTest < Minitest::Test

  def setup
    @albums = TopAlbumsApp.new
  end

  def test_sort_by_album_year
    @albums.sortYear
    assert_equal(@albums.at(0).year, " 1959\n")
    assert_equal(@albums.at(99).year, " 1997\n")
  end

   def test_sort_album_title_alphabetically
    @albums.sortTitle
    assert_equal(@albums.at(0).title, "'Live' at The Apollo")
    assert_equal(@albums.at(99).title, "Wish You Were Here")
  end

  def test_sort_by_album_title_length
    @albums.sortLength
    assert_equal(@albums.at(0).title.length, 3)
    assert_equal(@albums.at(99).title.length, 61)
  end
  
  def test_sort_by_album_rank
    @albums.sortRank
    assert_equal(@albums.at(0).rank, 1)
    assert_equal(@albums.at(99).rank, 100)
  end
  
end
