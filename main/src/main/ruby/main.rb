#!/usr/bin/env jruby
# frozen_string_literal: true

require_relative 'ui/mainframe.rb'
MainFrame.new

require_relative 'planter/test_renderer.rb'
require './uml-renderer-all.jar'
require './java-obj.jar'
TestRenderer.new.run
