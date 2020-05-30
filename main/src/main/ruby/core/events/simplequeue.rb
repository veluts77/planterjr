# frozen_string_literal: true

# Straight forward implementation of event queue.
# Going to be replaced with more elegant solution later on.
# Particularly synch/asynch support shuld be implemented.
class SimpleEventQueue
  require_relative 'event.rb'
  require_relative '../commands/factory.rb'

  def initialize
    @factory = CommandsFactory.new
  end

  def push(name, data = nil)
    event = Event.new(name, data)
    command = @factory.create event
    command.execute
  end

  def pop; end
end
