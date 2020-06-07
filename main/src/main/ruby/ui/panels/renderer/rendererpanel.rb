# frozen_string_literal: true

# Renderer Panel
class RendererPanel
  require_relative 'debug.rb'
  require_relative 'renderer.rb'
  require_relative 'controls.rb'

  import javax.swing.JPanel
  import java.awt.Dimension

  def initialize(event_queue)
    @event_queue = event_queue

    @panel = JPanel.new
    @panel.setPreferredSize Dimension.new 610, 610

    init_controls
    init_renderer
    init_debug
  end

  def init_controls
    @controls = RendererControls.new @event_queue
    @panel.add @controls.swing
  end

  def init_renderer
    @renderer = PlanterRenderer.new @event_queue
    @panel.add @renderer.swing
  end

  def init_debug
    @debug = DebugInfo.new @event_queue
    @panel.add @debug.swing
  end

  def swing
    @panel
  end
end
