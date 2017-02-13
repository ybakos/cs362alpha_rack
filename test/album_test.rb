require 'minitest/autorun'
require 'test/unit'

require_relative '../main'

RANK = 1
TITLE = "Test Album"
YEAR = "2017"

class AlbumTest < Minitest::Test

	def setup
		@album = Album.new(RANK, TITLE, YEAR)
	end

	def test_AlbumRankIsGreaterThanZero
		@album.instance_variable_set(:@rank, -1)
		refute @album.rank > 0
	end
end
