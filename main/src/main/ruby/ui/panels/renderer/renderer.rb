# frozen_string_literal: true

# Render area with scrolling support
class PlanterRenderer
  include_package 'planter.uml.renderer'
  require_relative 'rendererproxy.rb'

  import javax.swing.JPanel
  import javax.swing.JLabel
  import javax.swing.JScrollPane
  import javax.swing.ImageIcon
  import java.awt.Dimension

  def initialize(_event_queue)
    @image_label = JLabel.new
    @panel = JPanel.new
    @panel.add @image_label
    @scroll_pane = JScrollPane.new @panel
    @scroll_pane.setPreferredSize Dimension.new 600, 500

    @event_proxy = RendererProxy.new
    @event_proxy.add_observer self
  end

  def swing
    @scroll_pane
  end

  def update(hash)
    data = hash[:data]
    source = data[:source]
    renderer = PngRenderer.new(source)
    image = renderer.getRenderedImage
    icon = ImageIcon.new image
    @image_label.set_icon icon
  end
end
