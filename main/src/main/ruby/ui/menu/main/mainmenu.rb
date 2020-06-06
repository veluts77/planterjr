# frozen_string_literal: true

# Main menu
class MainMenu
  require_relative '../../controls/menuitem.rb'
  require_relative '../../controls/accelerator.rb'
  require_relative 'filemenu.rb'
  require_relative 'editmenu.rb'
  require_relative 'createmenu.rb'

  import javax.swing.JMenuBar

  def initialize(event_queue)
    @menu_bar = JMenuBar.new
    @menu_bar.add FileMenu.new(event_queue).swing
    @menu_bar.add EditMenu.new(event_queue).swing
    @menu_bar.add CreateMenu.new(event_queue).swing
  end

  def swing
    @menu_bar
  end
end
