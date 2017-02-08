require 'rack'

class TopAlbumsApp

	def call(env) 
		albums = []
		File.open("top_100_albums.txt", "r") do |file|
			albums = file.readlines
		end
		['200', {'Content-Type' => 'text/html'}, [albums.to_s]]
	end
	#design pattern front controller for call method
end

Rack::Handler::WEBrick.run(TopAlbumsApp.new)



