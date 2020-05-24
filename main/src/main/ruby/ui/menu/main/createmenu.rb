# frozen_string_literal: true

# Create menu
class CreateMenu
  import javax.swing.JMenu
  import java.awt.event.KeyEvent
  import java.lang.System

  def initialize
    @menu = JMenu.new 'Create'
    @menu.setMnemonic KeyEvent::VK_C

    @menu.add(MenuItem.new('Class', 'Create class', KeyEvent::VK_C).swing)
    @menu.add(MenuItem.new('Interface', 'Create interface', KeyEvent::VK_I).swing)
  end

  def swing
    @menu
  end
end
