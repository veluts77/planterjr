# frozen_string_literal: true

# Main menu
class MainMenu
  require_relative 'filemenu.rb'
  require_relative 'editmenu.rb'
  require_relative 'createmenu.rb'
  require_relative '../../controls/MenuItem.rb'

  import javax.swing.JMenuBar

  def initialize
    @menu_bar = JMenuBar.new
    @menu_bar.add FileMenu.new.swing
    @menu_bar.add EditMenu.new.swing
    @menu_bar.add CreateMenu.new.swing
  end

  def swing
    @menu_bar
  end
end
