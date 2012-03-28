require 'falconer'


module Falconer::Rails

	module ControllerMethods
		protected
		def falconer
			Falconer
		end
	end
	
	class Engine < ::Rails::Engine

		initializer 'falconer.add_middleware' do |app|
			app.middleware.insert_after ::Rack::Lock, Falconer::Rack
		end

		initializer 'falconer.controller_methods' do
			ActiveSupport.on_load :action_controller do
				include Falconer::Rails::ControllerMethods
				helper_method :falconer
			end
		end

	end
end

