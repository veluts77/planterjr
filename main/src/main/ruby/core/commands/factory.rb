# frozen_string_literal: true

# Place where commands are created
class CommandsFactory
  require_relative 'defaultcommand.rb'
  require_relative 'file/createnewfile.rb'
  require_relative 'editor/editorkeytyped.rb'
  require_relative 'editor/editorcaretchanged.rb'

  @@commands = [
    # file action commands (menu, buttons, etc)
    { name: :pe_new_file, cls: CreateNewFile },

    # main editor commands
    { name: :pe_key_typed, cls: EditorKeyTyped },
    { name: :pe_caret_changed, cls: EditorCaretChanged }
  ]

  def create(event)
    @@commands.each do |item|
      return item[:cls].new(event.data) if event.name == item[:name]
    end

    DefaultCommand.new event
  end
end
