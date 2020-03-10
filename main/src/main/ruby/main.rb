puts 'Hello from core Ruby!!!'

###

class MyApp
    require './java-obj.jar'
    include_package 'objects'

    def run
        puts 'Working with java object from imported package'
        obj = JavaObject.new
        obj.name = '"Ruby rocks"'
        res = obj.greetingsMessage
        puts res
    end
end

MyApp.new.run

###

require_relative 'core/swing.rb'
open_window

require_relative 'planter/test_renderer.rb'
require './uml-renderer-all.jar'
TestRenderer.new.run
