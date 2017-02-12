require_relative 'main'

use Rack::Reloader, 0

# This function doesn't belong here.
def render()
  ERB.new(@template).result(binding)
end

run TopAlbumsApp.new

