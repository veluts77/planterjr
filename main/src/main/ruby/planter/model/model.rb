# frozen_string_literal: true

# Base model with notify observers capability
class PlanterModel
  def initialize
    @observers = Set.new
  end

  def add_observer(observer)
    if observer.method_defined? :update
      abort 'Invalid observer: no update() method'
    else
      @observers.add observer
    end
  end

  def remove_observer(observer)
    @observers.delete observer
  end

  def remove_all_observers
    @observers.clear
  end

  def notify_observers(data)
    @observers.each { |o| @observers.update({ sender: o, data: data }) }
  end
end
