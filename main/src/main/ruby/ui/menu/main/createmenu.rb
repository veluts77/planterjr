# frozen_string_literal: true

# Create menu
class CreateMenu
  import javax.swing.JMenu
  import java.awt.event.KeyEvent
  import java.lang.System

  @@items = [
    { label: 'Class', tip: 'Create class', mnemonic: KeyEvent::VK_C, action: 'create class' },
    { label: 'Interface', tip: 'Create interface', mnemonic: KeyEvent::VK_I, action: 'create interface' }
  ]

  def initialize(event_queue)
    @menu = JMenu.new 'Create'
    @menu.setMnemonic KeyEvent::VK_C

    @@items.each do |hash|
      @menu.add MenuItem.new(hash, event_queue).swing
    end
  end

  def swing
    @menu
  end
end
