# frozen_string_literal: true

# Source representation
class PlantSource < PlanterModel
  def initialize
    reset
  end

  def reset
    # PlantUML text contents
    @source = ''
    # real position of the caret
    @dot = 0
    # selection position opposite to @dot (the same as @dot if no selection)
    @mark = 0

    notify_changed
  end

  def append(text)
    @source += text
    notify_changed
  end

  def new_line
    @source += "\n"
    notify_changed
  end

  private

  def notify_changed
    notify_observers self, { source: @source, dot: @dot, mark: @mark }
  end
end
