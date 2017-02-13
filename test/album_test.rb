require 'minitest/autorun'

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

	def test_AlbumRankIsLessThan101
		@album.instance_variable_set(:@rank, 101)
		refute @album.rank < 101
	end

	def test_AlbumRankIsAnInteger
		@album.instance_variable_set(:@rank, "one")
		refute @album.rank.is_a? Integer
	end
end
