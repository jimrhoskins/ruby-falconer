require 'json'

class Falconer::Rack
	def initialize(app)
		@app = app
	end

	def call(env)
		status, headers, response = @app.call(env)

		if env[Falconer::ACCEPT_HEADER_ENV]
			headers[Falconer::EVENTS_HEADER] = Falconer.flush.to_json
		end

		[status, headers, response]
	end
end
