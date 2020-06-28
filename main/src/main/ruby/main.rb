#!/usr/bin/env jruby
# frozen_string_literal: true

require_relative 'planter/facade.rb'
require_relative 'ui/mainframe.rb'
require_relative 'core/events/parallelqueue.rb'

require_relative 'uml-renderer-all.jar'
require_relative 'java-obj.jar'

MainFrame.new ParallelEventQueue.new
