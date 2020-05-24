# frozen_string_literal: true

# File menu
class FileMenu
  import javax.swing.JMenu
  import java.awt.event.KeyEvent
  import java.lang.System

  def initialize
    @menu = JMenu.new 'File'
    @menu.setMnemonic KeyEvent::VK_F

    item = MenuItem.new 'Exit', 'Exit application', KeyEvent::VK_X
    item.action { System.exit 0 }
    @menu.add(MenuItem.new('Open...', 'Open file', KeyEvent::VK_O).swing)
    @menu.add(MenuItem.new('Save', 'Save file', KeyEvent::VK_S).swing)
    @menu.add item.swing
  end

  def swing
    @menu
  end
end
