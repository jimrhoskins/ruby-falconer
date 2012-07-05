require 'spec_helper'

describe Falconer::Rack do
  include Rack::Test::Methods

  def app
    Rack::Builder.new do 
      use Falconer::Rack
      run Rack::Lobster.new
    end
  end

  def falconer_accept_header
    {"HTTP_#{Falconer::ACCEPT_HEADER.upcase.gsub '-', '_'}" => '1'}
  end

  def events_header
    last_response.headers[Falconer::EVENTS_HEADER]
  end

  before do
    Falconer.flush
  end

  describe 'falconer-request' do
    it 'should return a falconer event header' do
      get '/', {}, falconer_accept_header
      events_header.wont_be_nil
    end

    it 'should return a JSON encoded array' do
      Falconer.trigger 'foo', {:bar => 1}
      get '/', {}, falconer_accept_header
      events = JSON.parse events_header
      events.size.must_equal 1
      events[0].must_equal ['foo', {'bar'=> 1}]

    end

  end

  describe 'polling endpoint' do
    it 'should return 200 for the polling acition' do
      Falconer.trigger 'foo', {:bar => 1}
      get '/@falconer-poll', {}, falconer_accept_header
      last_response.body.must_equal ''
      events = JSON.parse events_header
      events.size.must_equal 1
      events[0].must_equal ['foo', {'bar'=> 1}]

    end

    it 'should return a conforming response' do
      falconer = Falconer::Rack.new(nil)
      result = falconer.call('PATH_INFO' => '/@falconer-poll')
      result[2].must_respond_to :each
    end
  end


  describe 'normal request' do
    it 'should return 200' do
      get '/'
      last_response.status.must_be :==, 200
    end

    it 'should not send falconer events header' do
      get '/'
      last_response.headers[Falconer::EVENTS_HEADER].must_be_nil
      last_response.headers['content-type'].wont_be_nil
    end

  end

end

