module Falconer
  class << self

    # Triggers a new event to be sent to the Falconer Client
    #
    # @param [String] event the name of the event to be triggered
    # @param [Object] data the data associated with the event
    #   This data will be transimitted through JSON encoding
    def trigger(event, data)
      store.add_event(event, data)
    end


    # Returns all queued events and empties queue
    #
    # @return [Array] list of event tuples ([event, data])
    def flush
      returned_events = store.events
      store.clear_events
      returned_events
    end

    protected

    def store
      @store ||= Falconer::Store::Memory.new
    end

  end
end
