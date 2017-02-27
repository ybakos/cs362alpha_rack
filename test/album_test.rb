require 'minitest/autorun'
require_relative '../album'

RANK = "1"
TITLE = "Test Album"
YEAR = "2017"

class AlbumTest < Minitest::Test

  def setup
    @album = Album.new(RANK, TITLE, YEAR)
  end

  def test_album_constructor
      assert_equal @album.rank, RANK
      assert_equal @album.title, TITLE
      assert_equal @album.year, YEAR
  end  

  def test_album_rank_is_integer
    assert_raises ArgumentError do
      rank = "wrong"
      title = "testing"
      year = "1999"

      testAlbum = Album.new(rank, title, year)
    end
  end

  def test_album_rank_is_greater_than_zero
    assert_raises ArgumentError do
      rank = "-11"
      title = "testing"
      year = "1999"
      
      testAlbum = Album.new(rank, title, year)
    end
  end

  def test_album_rank_is_less_than_101
    assert_raises ArgumentError do
      rank = "105"
      title = "testing"
      year = "1999"

      testAlbum = Album.new(rank, title, year)
    end
  end

  def test_album_title_is_not_empty
      assert_raises ArgumentError do
      rank = "1"
      title = ""
      year = "1999"

      testAlbum = Album.new(rank, title, year)
    end
  end

  def test_album_year_is_not_greater_than_current_year
    assert_raises ArgumentError do
      rank = "1"
      title = "Title"
      year = "2800"

      testAlbum = Album.new(rank, title, year)
    end
  end

end
