# frozen_string_literal: true

# Renderer Panel
class RendererPanel
  import javax.swing.JPanel
  import java.awt.Dimension

  def initialize(event_queue)
    @panel = JPanel.new
    @panel.setPreferredSize Dimension.new 600, 600
  end

  def swing
    @panel
  end
end
