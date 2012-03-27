require 'spec_helper'

describe Falconer::Store::Memory do
	before do
		@store = Falconer::Store::Memory.new
	end

	describe 'empty store' do
		it 'should be empty' do
			@store.events.must_equal []
		end
	end

	describe 'with one event' do
		before do
			@store.add_event 'name-1', 'data-1'
		end

		it 'should have one event' do
			@store.events.must_equal [['name-1', 'data-1']]
		end

		it 'should clear events' do
			@store.events.must_equal [['name-1', 'data-1']]
			@store.clear_events
			@store.events.must_equal []
		end
	end

	describe 'with multiple events' do
		before do
			@events = [
				['event-1', 'data1']	,
				['event-2', 'data2']	,
				['event-3', 'data3']	
			]

			@events.each do |(event, data)|
				@store.add_event event, data
			end

		end

		it 'should have all events in order' do
			@store.events.must_equal @events
		end

	end

end
