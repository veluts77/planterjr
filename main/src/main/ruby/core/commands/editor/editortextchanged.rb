# frozen_string_literal: true

# Text change event recieved from main editor
class EditorTextChanged
  def initialize(data)
    @text = data
    @source = PlanterFacade.source
  end

  def execute
    @source.source! @text
  end
end
