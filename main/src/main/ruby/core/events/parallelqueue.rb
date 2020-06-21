# frozen_string_literal: true

# Parallel thread implementation of event queue.
class ParallelEventQueue
  require_relative 'event.rb'
  require_relative '../commands/factory.rb'

  def initialize
    @factory = CommandsFactory.new
    @queue = Queue.new
    @thread_is_alive = true
    @background_worker = Thread.new do
      process while @thread_is_alive
      @queue.close
    end
  end

  def push(name, data = nil)
    event = Event.new(name, data)
    @queue << event
  end

  def pop
    event = @queue.pop
    command = @factory.create event
    command.execute
  end

  def process
    if @queue.empty?
      sleep 0.1
    else
      pop
    end
  end

  def destroy
    @thread_is_alive = false
  end
end
