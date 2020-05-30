# frozen_string_literal: true

# Default command is created if unexpected invoked.
class DefaultCommand
  def initialize(event)
    @event = event
  end

  def execute
    msg = "Unknown event: '#{@event.name}'"
    msg += " with data: #{@event.data}" unless @event.data.nil?
    puts msg
  end
end
