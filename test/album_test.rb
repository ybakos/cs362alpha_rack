require 'minitest/autorun'

require_relative '../main'

RANK = 1
TITLE = "Test Album"
YEAR = "2017"

class AlbumTest < Minitest::Test

	def setup
		@album = Album.new(RANK, TITLE, YEAR)
	end

	# tests here
end
