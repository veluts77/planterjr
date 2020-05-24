# frozen_string_literal: true

# Main window of the application
class MainFrame < javax.swing.JFrame
  require_relative 'menu/main/mainmenu.rb'

  import javax.swing.JFrame

  def initialize
    super 'Planter Jr'

    init_ui
  end

  private

  def init_ui
    setJMenuBar MainMenu.new.swing
    setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
    setSize 1200, 800
    setLocationRelativeTo nil
    setVisible true
  end
end
