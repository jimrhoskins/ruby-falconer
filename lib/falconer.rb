require 'falconer/version'
require 'falconer/class_methods'
require 'falconer/store/memory'

require 'falconer/rack'

module Falconer
  ACCEPT_HEADER = 'x-falconer-accept-events'
  EVENTS_HEADER = 'x-falconer-events'
  ACCEPT_HEADER_ENV = "HTTP_#{ACCEPT_HEADER.upcase.gsub('-','_')}"
end

