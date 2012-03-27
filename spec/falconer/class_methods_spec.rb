require 'spec_helper'

describe Falconer, 'class methods' do
	it 'should respond to trigger' do
		Falconer.must_respond_to :trigger
	end

	it 'should respond to flush' do
		Falconer.must_respond_to :flush
	end


	describe 'flush' do
		describe 'with no triggered events' do
			it 'should return an empty array' do
				Falconer.flush.must_equal []
			end
		end 

		describe 'with a single triggered event' do
			before do
				Falconer.flush
				Falconer.trigger 'event-one', {'some' => 'data'}
			end

			it 'should return an array with one event' do
				Falconer.flush.size.must_equal 1
			end

			it 'should return the event as a size 2 tuple' do
				Falconer.flush[0].size.must_equal 2
			end

			it 'should return an event as an array with name and data' do
				Falconer.flush.must_equal [['event-one', {'some' => 'data'}]]
			end


			it 'should clear the data after flushed' do
				Falconer.flush
				Falconer.flush.must_equal []
			end
		end

		describe 'with several triggered events' do
			before do
				Falconer.flush
				Falconer.trigger 'event-one', {'one' => 1}
				Falconer.trigger 'event-two', {'two' => 2}
				Falconer.trigger 'event-three', {'three' => 3}
			end


			it 'should return events in first-in-first-out order' do
				Falconer.flush.must_equal [
					['event-one', {'one' => 1}]	,
					['event-two', {'two' => 2}]	,
					['event-three', {'three' => 3}]	
				]

			end

		end

	end

end
