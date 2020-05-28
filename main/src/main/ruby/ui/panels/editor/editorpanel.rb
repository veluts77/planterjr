# frozen_string_literal: true

# Editor panel
class EditorPanel
  import javax.swing.JPanel
  import javax.swing.JLabel
  import javax.swing.JTextArea
  import java.awt.BorderLayout

  def initialize(event_queue)
    @editor = JTextArea.new
    @panel = JPanel.new
    @panel.setLayout BorderLayout.new 10, 10
    @panel.add @editor, BorderLayout::CENTER
  end

  def swing
    @panel
  end
end
