# frozen_string_literal: true

# Action button creation wrapper
class ActionButton
  import javax.swing.JButton

  def initialize(hash, event_queue)
    @button = JButton.new hash[:label]
    @button.setToolTipText hash[:tip]
    @button.addActionListener { |_e| event_queue.push hash[:action] }
  end

  def swing
    @button
  end
end
