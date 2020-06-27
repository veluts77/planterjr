# frozen_string_literal: true

# Refresh diagram (forced) recieved from controls
class RefreshDiagram
  def initialize(data); end

  def execute
    PlanterFacade.diagram.refresh
  end
end
