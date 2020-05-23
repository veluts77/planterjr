# frozen_string_literal: true

# JMenuItem creation wrapper
class MenuItem
  import javax.swing.JMenuItem

  def initialize(label, tooltip, key_event)
    @item = JMenuItem.new label
    @item.setMnemonic key_event
    @item.setToolTipText tooltip
  end

  def action(&block)
    @item.addActionListener block
    self
  end

  def swing
    @item
  end
end
