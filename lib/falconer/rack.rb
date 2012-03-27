require 'json'

class Falconer::Rack
	def initialize(app)
		@app = app
	end

	def call(env)
		status, headers, response = @app.call(env)

		if env['HTTP_X_FALCONER_ACCEPT_EVENTS']
			headers['x-falconer-events'] = Falconer.flush.to_json
		end

		[status, headers, response]
	end
end
