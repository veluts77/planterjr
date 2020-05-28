# frozen_string_literal: true

# JMenuItem creation wrapper
class MenuItem
  import javax.swing.JMenuItem

  def initialize(hash, event_queue)
    @item = JMenuItem.new hash[:label]
    @item.java_send :setMnemonic, [Java::char], hash[:mnemonic]
    @item.setToolTipText hash[:tip]
  end

  def action(&block)
    @item.addActionListener block
    self
  end

  def swing
    @item
  end
end
