require 'json'

class Falconer::Rack
  def initialize(app)
    @app = app
  end

  def call(env)
    unless env['PATH_INFO'] == '/@falconer-poll'
      status, headers, response = @app.call(env)
    else
      status = 200
      headers = {'Content-Length'=> '0'}
      response = ''
    end

    if env[Falconer::ACCEPT_HEADER_ENV]
      headers[Falconer::EVENTS_HEADER] = Falconer.flush.to_json
    end

    [status, headers, response]
    end
  end
