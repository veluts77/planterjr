# frozen_string_literal: true

# Copy diagram to clipboard command
class CopyDiagramToClipboard
  def initialize(data); end

  def execute
    PlanterFacade.diagram.copy_to_clipboard
  end
end
