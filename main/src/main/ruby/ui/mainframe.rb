# frozen_string_literal: true

# Main window of the application
class MainFrame < javax.swing.JFrame
  require_relative 'menu/main/mainmenu.rb'
  require_relative 'toolbar/classbar.rb'
  require_relative 'panels/editor/editorpanel.rb'
  require_relative 'panels/renderer/rendererpanel.rb'

  import java.awt.BorderLayout
  import javax.swing.JFrame

  def initialize(event_queue)
    super 'Planter Jr'

    @event_queue = event_queue
    init_menu
    init_components
    init_window_and_position
  end

  private

  def init_menu
    setJMenuBar MainMenu.new(@event_queue).swing
  end

  def init_components
    add EditorPanel.new(@event_queue).swing, BorderLayout::CENTER
    add ClassBar.new(@event_queue).swing, BorderLayout::NORTH
    add RendererPanel.new(@event_queue).swing, BorderLayout::EAST
  end

  def init_window_and_position
    setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
    setSize 1200, 800
    setLocationRelativeTo nil
    setVisible true
  end
end
