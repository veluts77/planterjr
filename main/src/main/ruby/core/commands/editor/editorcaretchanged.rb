# frozen_string_literal: true

# Caret event recieved from main editor
class EditorCaretChanged
  def initialize(data)
    @dot = data.dot
    @mark = data.mark
  end

  def execute
    puts "#{@dot}, #{@mark}"
  end
end
