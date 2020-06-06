# frozen_string_literal: false

# Source representation
class PlantSource < PlanterModel
  def initialize
    super
    reset!
  end

  def reset!
    # PlantUML text contents
    @source = ''
    # real position of the caret
    @dot = 0
    # selection position opposite to @dot (the same as @dot if no selection)
    @mark = 0

    notify_changed
  end

  def source!(value)
    @source = value
    notify_changed
  end

  def append_char!(char)
    if char == 8
      @source.chop!
    else
      @source << char
    end
    notify_changed
  end

  def new_line!
    @source += "\n"
    notify_changed
  end

  def dot!(value)
    @dot = value
    notify_changed
  end

  def mark!(value)
    @mark = value
    notify_changed
  end

  private

  def notify_changed
    notify_observers({ source: @source, dot: @dot, mark: @mark })
  end
end
