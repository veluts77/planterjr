# frozen_string_literal: true

# Simple event
class Event
  attr_reader :name, :data

  def initialize(name, data)
    @name = name
    @data = data
  end
end
