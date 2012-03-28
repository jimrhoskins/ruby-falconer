require 'falconer/store'

class Falconer::Store::Memory

  def initialize
    @events = []
  end

  def add_event(event, data=nil)
    @events << [event, data]
  end

  def events
    @events.dup
  end

  def clear_events
    @events = []
  end

end
