# frozen_string_literal: true

# Caret event recieved from main editor
class EditorCaretChanged
  def initialize(data)
    @dot = data.dot
    @mark = data.mark
    @source = PlanterFacade.source
  end

  def execute
    @source.dot! @dot
    @source.mark! @mark
  end
end
