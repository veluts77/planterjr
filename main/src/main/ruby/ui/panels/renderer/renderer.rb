# frozen_string_literal: true

# Render area with scrolling support
class PlanterRenderer
  include_package 'planter.uml.renderer'
  include_package 'planter.clipboard'
  include_package 'planter.file'
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
    PlanterFacade.diagram.add_observer self
  end

  def swing
    @scroll_pane
  end

  def update(hash)
    data = hash[:data]
    if hash[:sender] == @event_proxy
      update_from_proxy(data)
    else
      update_from_diagram_facade(data)
    end
  end

  private

  def update_from_proxy(data)
    source = data[:source]
    renderer = PngRenderer.new source
    @rendered_image = renderer.getRenderedImage
    icon = ImageIcon.new @rendered_image
    @image_label.set_icon icon
  end

  def update_from_diagram_facade(data)
    return if @rendered_image.nil?

    if data[:command] == :cmd_copy
      copy_to_clipboard
    elsif data[:command] == :cmd_save
      save_to_file data[:filename]
    end
  end

  def copy_to_clipboard
    clipboard = PlanterClipboard.new
    clipboard.copyImage @rendered_image
  end

  def save_to_file(full_filename)
    saver = ImageSaver.new @rendered_image
    saver.save full_filename
  end
end
