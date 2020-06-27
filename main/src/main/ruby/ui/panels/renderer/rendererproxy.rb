# frozen_string_literal: true

# The class indercepts updates of source code handles pauses
# and forwards to the PlanterRenderer instance when needed.
class RendererProxy < PlanterModel
  def initialize
    super

    @delay = 3.0
    @remaining_time = 0.0
    @mutex = Mutex.new

    PlanterFacade.source.add_observer self
    PlanterFacade.diagram.add_observer self
  end

  def update(hash)
    if hash[:sender] == PlanterFacade.source
      update_from_source(hash[:data])
    else
      update_from_diargam(hash[:data])
    end
  end

  private

  def update_from_source(data)
    restart_remaining_time
    create_worker if woker_is_not_running?
    @mutex.synchronize { @data = data }
  end

  def update_from_diargam(data)
    force_refresh if data[:command] == :cmd_refresh
  end

  def create_worker
    @background_worker = Thread.new do
      while @remaining_time.positive?
        sleep 0.5
        decrease_remaining_time
      end
      notify_delay_is_completed
    end
  end

  def woker_is_not_running?
    @background_worker.nil? || @background_worker.status == false
  end

  def restart_remaining_time
    @mutex.synchronize { @remaining_time = @delay }
  end

  def decrease_remaining_time
    @mutex.synchronize { @remaining_time -= 0.5 }
  end

  def force_refresh
    @mutex.synchronize { @remaining_time = 0.0 }
  end

  def notify_delay_is_completed
    @mutex.synchronize { notify_observers @data }
  end
end
