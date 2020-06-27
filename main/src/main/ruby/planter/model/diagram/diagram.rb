# frozen_string_literal: true

# Diagram related features
class PlantDiagram < PlanterModel
  def initialize
    super
  end

  def refresh
    notify_observers({ command: :cmd_refresh })
  end

  def copy_to_clipboard
    notify_observers({ command: :cmd_copy })
  end
end
