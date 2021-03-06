# frozen_string_literal: true

# Place where commands are created
class CommandsFactory
  require_relative 'defaultcommand.rb'
  require_relative 'file/createnewfile.rb'
  require_relative 'file/exitapplication.rb'
  require_relative 'editor/editorkeytyped.rb'
  require_relative 'editor/editorcaretchanged.rb'
  require_relative 'editor/editortextchanged.rb'
  require_relative 'diagram/refreshdiagram.rb'
  require_relative 'diagram/copydiagram.rb'
  require_relative 'diagram/savediagram.rb'

  @@commands = [
    # file action commands (menu, buttons, etc)
    { name: :pe_new_file, cls: CreateNewFile },
    { name: :pe_exit_app, cls: ExitApplication },

    # main editor commands
    { name: :pe_key_typed, cls: EditorKeyTyped },
    { name: :pe_text_changed, cls: EditorTextChanged },
    { name: :pe_caret_changed, cls: EditorCaretChanged },

    # diagram related commands
    { name: :pe_refresh_diagram, cls: RefreshDiagram },
    { name: :pe_copy_diagram, cls: CopyDiagramToClipboard },
    { name: :pe_save_diagram, cls: SaveDiagram }
  ]

  def create(event)
    @@commands.each do |item|
      return item[:cls].new(event.data) if event.name == item[:name]
    end

    DefaultCommand.new event
  end
end
