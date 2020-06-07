# frozen_string_literal: true

class RendererControls
  require_relative '../../controls/button.rb'
  import javax.swing.JToolBar

  @@buttons = [
    { label: 'Refresh', tip: 'Refresh immediately',
      action: :pe_refresh_diagram },
    { label: 'Copy', tip: 'Copy diagram to clipboard',
      action: :pe_copy_diagram },
    { label: 'Save', tip: 'Save to file',
      action: :pe_save_diagram }
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
