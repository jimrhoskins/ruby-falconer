ENV['RACK_ENV'] = 'test'
require 'minitest/spec'
require 'minitest/wscolor'
require 'minitest/autorun'
require 'rack/lobster'
require 'rack/test'

$:.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'falconer'
