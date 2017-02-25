require 'minitest/autorun'

require_relative '../album'

RANK = 1
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

  def test_album_rank_is_greater_than_zero
    assert(@album.rank > 0)
  end

  def test_album_rank_is_less_than_101
    assert(@album.rank < 101)
  end

  def test_album_title_is_not_empty
    assert(!@album.title.empty?)
  end

  def test_album_year_is_not_greater_than_current_year
    current_year = Time.new.year.to_i
    assert(@album.year.to_i <= current_year)
  end

end
