# frozen_string_literal: true

# File menu
class FileMenu
  import javax.swing.JMenu
  import javax.swing.KeyStroke
  import java.awt.event.KeyEvent
  import java.awt.event.InputEvent
  import java.lang.System

  @@items = [
    { label: 'New', tip: 'New file', mnemonic: KeyEvent::VK_N,
      action: :pe_new_file },
    { label: 'Open...', tip: 'Open file', mnemonic: KeyEvent::VK_O,
      action: :pe_open_file, accelerator: Accelerator.ctrl('O') },
    { label: 'Save', tip: 'Save file', mnemonic: KeyEvent::VK_S,
      action: :pe_save_file, accelerator: Accelerator.ctrl('S') },
    { label: 'Exit', tip: 'Exit application', mnemonic: KeyEvent::VK_X,
      action: :pe_exit_app }
  ]

  def initialize(event_queue)
    @menu = JMenu.new 'File'
    @menu.java_send :setMnemonic, [Java::char], KeyEvent::VK_F

    @@items.each do |hash|
      @menu.add MenuItem.new(hash, event_queue).swing
    end
  end

  def swing
    @menu
  end
end
