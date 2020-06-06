# frozen_string_literal: true

# Create menu
class CreateMenu
  import javax.swing.JMenu
  import java.awt.event.KeyEvent
  import java.lang.System

  @@items = [
    { label: 'Class', tip: 'Create class', mnemonic: KeyEvent::VK_C,
      action: :pe_create_class },
    { label: 'Interface', tip: 'Create interface', mnemonic: KeyEvent::VK_I,
      action: :pe_create_interface }
  ]

  def initialize(event_queue)
    @menu = JMenu.new 'Create'
    @menu.java_send :setMnemonic, [Java::char], KeyEvent::VK_C

    @@items.each do |hash|
      @menu.add MenuItem.new(hash, event_queue).swing
    end
  end

  def swing
    @menu
  end
end
