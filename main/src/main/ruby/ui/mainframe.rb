# frozen_string_literal: true

# Main window of the application
class MainFrame < javax.swing.JFrame
  require_relative 'menu/main/mainmenu.rb'
  require_relative 'toolbar/classbar.rb'

  import java.awt.BorderLayout
  import javax.swing.JFrame

  def initialize
    super 'Planter Jr'

    init_menu
    init_toolbar
    init_window_and_position
  end

  private

  def init_menu
    setJMenuBar MainMenu.new(nil).swing
  end

  def init_toolbar
    add ClassBar.new(nil).swing, BorderLayout::NORTH
  end

  def init_window_and_position
    setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
    setSize 1200, 800
    setLocationRelativeTo nil
    setVisible true
  end
end
