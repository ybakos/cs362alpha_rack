require_relative 'main'

use Rack::Reloader, 0

run TopAlbumsApp.new

