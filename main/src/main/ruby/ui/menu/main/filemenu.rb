# frozen_string_literal: true

# File menu
class FileMenu
  import javax.swing.JMenu
  import java.awt.event.KeyEvent
  import java.lang.System

  @@items = [
    { label: 'New', tip: 'New file', mnemonic: KeyEvent::VK_N, action: 'new file' },
    { label: 'Open...', tip: 'Open file', mnemonic: KeyEvent::VK_O, action: 'open file' },
    { label: 'Save', tip: 'Save file', mnemonic: KeyEvent::VK_S, action: 'save file' },
    { label: 'Exit', tip: 'Exit application', mnemonic: KeyEvent::VK_X, action: 'exit application' }
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
