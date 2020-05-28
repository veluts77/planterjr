# frozen_string_literal: true

# Edit menu
class EditMenu
  import javax.swing.JMenu
  import java.awt.event.KeyEvent
  import java.lang.System

  @@items = [
    { label: 'Search...', tip: 'Search', mnemonic: KeyEvent::VK_S, action: 'search in text' },
    { label: 'Replace...', tip: 'Replace', mnemonic: KeyEvent::VK_R, action: 'replace in text' }
  ]

  def initialize(event_queue)
    @menu = JMenu.new 'Edit'
    @menu.java_send :setMnemonic, [Java::char], KeyEvent::VK_E

    @@items.each do |hash|
      @menu.add MenuItem.new(hash, event_queue).swing
    end
  end

  def swing
    @menu
  end
end
