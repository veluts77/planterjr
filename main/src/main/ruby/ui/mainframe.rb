# frozen_string_literal: true

# include Java

require_relative 'controls/MenuItem.rb'

import java.awt.event.KeyEvent
import javax.swing.JButton
import javax.swing.JFrame
import javax.swing.JMenuBar
import javax.swing.JMenu
import java.lang.System

# Main window of the application
class MainFrame < JFrame
  def initialize
    super 'Planter Jr'

    init_ui
  end

  private

  def init_ui
    init_menu
    setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
    setSize 1200, 800
    setLocationRelativeTo nil
    setVisible true
  end

  def init_menu
    menu_bar = JMenuBar.new
    menu_bar.add file_menu
    setJMenuBar menu_bar
  end

  def file_menu
    menu = JMenu.new 'File'
    menu.setMnemonic KeyEvent::VK_F

    item = MenuItem.new 'Exit', 'Exit application', KeyEvent::VK_X
    item.action { System.exit 0 }
    menu.add(MenuItem.new('Open...', 'Open file', KeyEvent::VK_O).swing)
    menu.add(MenuItem.new('Save', 'Save file', KeyEvent::VK_S).swing)
    menu.add item.swing

    menu
  end
end
