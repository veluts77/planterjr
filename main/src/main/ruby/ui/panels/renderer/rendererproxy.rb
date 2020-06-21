# frozen_string_literal: true

# The class indercepts updates of source code handles pauses
# and forwards to the PlanterRenderer instance when needed.
class RendererProxy < PlanterModel
  def initialize
    super

    @delay = 3
    @remaining_time = 0
    @mutex = Mutex.new

    PlanterFacade.source.add_observer self
  end

  def update(hash)
    reset_remaining_time
    create_worker if woker_is_not_running?
    @mutex.synchronize { @data = hash[:data] }
  end

  private

  def create_worker
    @background_worker = Thread.new do
      while @remaining_time.positive?
        sleep 1.0
        decrease_remaining_time
      end
      notify_delay_is_completed
    end
  end

  def woker_is_not_running?
    @background_worker.nil? || @background_worker.status == false
  end

  def reset_remaining_time
    @mutex.synchronize { @remaining_time = @delay }
  end

  def decrease_remaining_time
    @mutex.synchronize { @remaining_time -= 1 }
  end

  def notify_delay_is_completed
    @mutex.synchronize { notify_observers @data }
  end
end
