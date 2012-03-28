require 'spec_helper_rails'
require 'falconer/rails'

describe Falconer::Rails do

  describe "Middleware" do
    it 'inserts Falconer::Rack after Rack::Lock' do
      Rails.configuration.middleware.must_include Falconer::Rack
    end
  end


  describe 'Controller extensions' do
    before do
      @controller = ApplicationController.new
    end

    it 'should have a falconer method' do
      @controller.must_respond_to :falconer
    end

    it 'should return the Falconer Class for falconer' do
      @controller.send(:falconer).must_equal Falconer
    end

    it 'should be private' do
      lambda {
        @controller.falconer
      }.must_raise NoMethodError
    end


    it 'should expose falconer as helper method' do
      @controller.send(:_helper_methods).must_include :falconer
    end
  end
end
