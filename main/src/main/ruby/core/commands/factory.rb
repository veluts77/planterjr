# frozen_string_literal: true

# Place where commands are created
class CommandsFactory
  require_relative 'defaultcommand.rb'
  require_relative 'file/createnewfile.rb'

  @@commands = [
    { name: 'new file', cls: CreateNewFile }
  ]

  def create(event)
    @@commands.each do |item|
      return item[:cls].new(event.data) if event.name == item[:name]
    end

    DefaultCommand.new event
  end
end
