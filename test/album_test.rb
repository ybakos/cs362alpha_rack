require 'minitest/autorun'

require_relative '../album'

RANK = 1
TITLE = "Test Album"
YEAR = "2017"

class AlbumTest < Minitest::Test

  def setup
    @album = Album.new(RANK, TITLE, YEAR)
  end

  def test_album_rank_is_greater_than_zero
    flunk
  end

  def test_album_rank_is_less_than_101
    flunk
  end

  def test_album_rank_is_an_integer
    flunk
  end

  def test_album_constructor
      assert_equal @album.rank, RANK
      assert_equal @album.title, TITLE
      assert_equal @album.year, YEAR
  end

end
