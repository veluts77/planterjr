#!/usr/bin/env jruby
# frozen_string_literal: true

require './planter/facade.rb'
require './ui/mainframe.rb'
# require './core/events/parallelqueue.rb'
require './core/events/simplequeue.rb'

require './uml-renderer-all.jar'
require './java-obj-all.jar'

java_import com.formdev.flatlaf.FlatLightLaf

def setup_flat_laf
  FlatLightLaf.install
end

setup_flat_laf
# MainFrame.new ParallelEventQueue.new
MainFrame.new SimpleEventQueue.new