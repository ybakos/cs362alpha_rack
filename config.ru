require_relative 'main'

use Rack::Reloader, 0


def render()
  ERB.new(@template).result(binding)
end

run TopAlbumsApp.new

