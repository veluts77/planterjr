# frozen_string_literal: true

# JMenuItem creation wrapper
class MenuItem
  import javax.swing.JMenuItem

  def initialize(hash, event_queue)
    @item = JMenuItem.new hash[:label]
    @item.java_send :setMnemonic, [Java::char], hash[:mnemonic]
    @item.setToolTipText hash[:tip]
    @item.addActionListener { |_e| event_queue.push hash[:action] }
  end

  def swing
    @item
  end
end
