# frozen_string_literal: true

# Editor panel
class EditorPanel
  import javax.swing.JPanel
  import javax.swing.JLabel
  import javax.swing.JEditorPane
  import java.awt.BorderLayout

  def initialize(event_queue)
    init_editor event_queue
    @panel = JPanel.new
    @panel.setLayout BorderLayout.new 10, 10
    @panel.add @editor, BorderLayout::CENTER
  end

  def init_editor(event_queue)
    @editor = JEditorPane.new
    @editor.addKeyListener EditorPanel::KeyListener.new event_queue
    @editor.addCaretListener EditorPanel::CaretListener.new event_queue
  end

  def swing
    @panel
  end

  # Key processing for editor
  class KeyListener
    def initialize(event_queue)
      @event_queue = event_queue
    end

    def key_pressed(event); end

    def key_released(event); end

    def key_typed(event)
      alt_modifier = 8
      return if event.modifiers == alt_modifier

      @event_queue.push :pe_key_typed, event
    end
  end

  # Caret precessing for editor
  class CaretListener
    def initialize(event_queue)
      @event_queue = event_queue
    end

    def caret_update(event)
      @event_queue.push :pe_caret_changed, event
    end
  end
end
