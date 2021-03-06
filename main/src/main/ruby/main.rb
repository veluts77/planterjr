#!/usr/bin/env jruby
# frozen_string_literal: true

require './planter/facade.rb'
require './ui/mainframe.rb'
require './core/events/parallelqueue.rb'

require './uml-renderer.jar'
require './java-obj.jar'

java_import com.formdev.flatlaf.FlatLightLaf

def setup_flat_laf
  FlatLightLaf.install
end

setup_flat_laf
MainFrame.new ParallelEventQueue.new
