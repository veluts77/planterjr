# frozen_string_literal: true

# Class diagram related tool bar
class ClassBar
  require_relative '../controls/button.rb'
  import javax.swing.JToolBar

  @@buttons = [
    { label: 'Class', tip: 'Creates Class', action: 'create class' },
    { label: 'Interface', tip: 'Creates Interface', action: 'create interface' }
  ]

  def initialize(event_queue)
    @toolbar = JToolBar.new
    @@buttons.each do |hash|
      @toolbar.add ActionButton.new(hash, event_queue).swing
    end
  end

  def swing
    @toolbar
  end
end
