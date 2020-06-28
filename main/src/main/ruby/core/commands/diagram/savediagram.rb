# frozen_string_literal: true

# Save diagram to file
class SaveDiagram
  def initialize(data); end

  def execute
    # temporary implemetation without filename selection
    PlanterFacade.diagram.save 'temp.png'
  end
end
