# frozen_string_literal: true

# Renderer Panel
class RendererPanel
  import javax.swing.JPanel
  import javax.swing.JLabel
  import java.awt.Dimension
  import javax.swing.JEditorPane
  import java.awt.BorderLayout

  def initialize(event_queue)
    @panel = JPanel.new
    @panel.setPreferredSize Dimension.new 600, 600
    init_debug
    PlanterFacade.source.add_observer self
  end

  def swing
    @panel
  end

  def update(hash)
    update_debug hash
  end

  private

  def init_debug
    @mirror = JEditorPane.new
    @mirror.setPreferredSize Dimension.new 550, 200
    @panel.add @mirror

    @label = JLabel.new 'yet empty'
    @panel.add @label
  end

  def update_debug(hash)
    data = hash[:data]
    source = data[:source]
    dot = data[:dot]
    mark = data[:mark]
    @label.setText "dot = #{dot}, mark = #{mark}"
    @mirror.setEditable false
    @mirror.setText source
  end
end
