# frozen_string_literal: true

# Edit menu
class EditMenu
  import javax.swing.JMenu
  import java.awt.event.KeyEvent
  import java.lang.System

  def initialize
    @menu = JMenu.new 'Edit'
    @menu.setMnemonic KeyEvent::VK_E

    @menu.add(MenuItem.new('Search...', 'Search', KeyEvent::VK_S).swing)
    @menu.add(MenuItem.new('Replace...', 'Replace', KeyEvent::VK_R).swing)
  end

  def swing
    @menu
  end
end
