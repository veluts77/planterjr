# frozen_string_literal: true

# Base model with notify observers capability
class PlanterModel
  require 'set'

  def initialize
    @observers = Set.new
  end

  def add_observer(observer)
    unless observer.methods.include? :update
      raise 'Invalid observer: no update() method'
    end

    @observers.add observer
  end

  def remove_observer(observer)
    @observers.delete observer
  end

  def remove_all_observers
    @observers.clear
  end

  def notify_observers(data)
    @observers.each { |o| o.update({ sender: self, data: data }) }
  end
end
