#!/usr/bin/env jruby
# frozen_string_literal: true

require_relative 'planter/facade.rb'
require_relative 'ui/mainframe.rb'
require_relative 'core/events/parallelqueue.rb'

require_relative 'uml-renderer-all.jar'
require_relative 'java-obj.jar'

java_import javax.swing.UIManager
java_import javax.swing.plaf.nimbus.NimbusLookAndFeel
java_import java.awt.Font
def setup_look_and_feel
  laf = NimbusLookAndFeel.new
  UIManager.set_look_and_feel laf
  laf.getDefaults.put('defaultFont', Font.new('Arial', Font::BOLD, 14))
end

setup_look_and_feel
MainFrame.new ParallelEventQueue.new
