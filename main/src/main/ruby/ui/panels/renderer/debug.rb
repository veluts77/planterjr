# frozen_string_literal: true

# Simple debug information for Source model
class DebugInfo
  import javax.swing.JPanel
  import javax.swing.JLabel
  import java.awt.Dimension
  import javax.swing.JEditorPane

  def initialize(_event_queue)
    @panel = JPanel.new
    @panel.setPreferredSize Dimension.new 550, 200

    @mirror = JEditorPane.new
    @mirror.setPreferredSize Dimension.new 550, 170
    @panel.add @mirror

    @label = JLabel.new 'yet empty'
    @panel.add @label

    PlanterFacade.source.add_observer self
  end

  def swing
    @panel
  end

  def update(hash)
    data = hash[:data]
    source = data[:source]
    dot = data[:dot]
    mark = data[:mark]
    @label.setText "dot = #{dot}, mark = #{mark}"
    @mirror.setEditable false
    @mirror.setText source
  end
end
