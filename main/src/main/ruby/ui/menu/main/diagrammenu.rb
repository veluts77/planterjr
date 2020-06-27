# frozen_string_literal: true

# Diagram menu
class DiagramMenu
  import javax.swing.JMenu
  import java.awt.event.KeyEvent
  import java.lang.System

  @@items = [
    { label: 'Refresh', tip: 'Refresh diagram', mnemonic: KeyEvent::VK_R,
      action: :pe_refresh_diagram, accelerator: Accelerator.ctrl('R') },
    { label: 'Copy', tip: 'Copy diagram to clipboard', mnemonic: KeyEvent::VK_C,
      action: :pe_copy_diagram, accelerator: Accelerator.ctrl('D') },
    { label: 'Save...', tip: 'Save diagram to file', mnemonic: KeyEvent::VK_S,
      action: :pe_save_diagram, accelerator: Accelerator.ctrl_shift('D') }
  ]

  def initialize(event_queue)
    @menu = JMenu.new 'Diagram'
    @menu.java_send :setMnemonic, [Java::char], KeyEvent::VK_D

    @@items.each do |hash|
      @menu.add MenuItem.new(hash, event_queue).swing
    end
  end

  def swing
    @menu
  end
end
