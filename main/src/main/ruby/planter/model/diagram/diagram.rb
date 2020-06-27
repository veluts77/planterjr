# frozen_string_literal: true

# Diagram related features
class PlantDiagram < PlanterModel
  def initialize
    super
  end

  def refresh
    notify_observers({ command: :cmd_refresh})
  end
end
