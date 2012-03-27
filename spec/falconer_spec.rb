require 'spec_helper'

describe Falconer do
	describe 'constants' do

		it 'should define the events header' do
			Falconer::EVENTS_HEADER.must_equal 'x-falconer-events'
		end

		it 'should define the accept events header' do
			Falconer::ACCEPT_HEADER.must_equal 'x-falconer-accept-events'
		end

	end

end
