# frozen_string_literal: true

# Generates Java KeyStrokes as a menu accelerator
class Accelerator
  import javax.swing.KeyStroke
  import java.awt.event.KeyEvent
  import java.awt.event.InputEvent

  def self.ctrl(char)
    stroke_for char, InputEvent::CTRL_DOWN_MASK
  end

  def self.shift(char)
    stroke_for char, InputEvent::SHIFT_DOWN_MASK
  end

  def self.alt(char)
    stroke_for char, InputEvent::ALT_DOWN_MASK
  end

  def self.ctrl_shift(char)
    stroke_for char, (InputEvent::CTRL_DOWN_MASK + InputEvent::SHIFT_DOWN_MASK)
  end

  def self.stroke_for(char, modifier)
    KeyStroke.getKeyStroke char.ord, modifier
  end
end
