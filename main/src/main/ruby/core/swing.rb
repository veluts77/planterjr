require 'java'

JFrame = javax.swing.JFrame
JPanel = javax.swing.JPanel
FlowLayout = java.awt.FlowLayout
JLabel = javax.swing.JLabel

def open_window
    frame = JFrame.new("Window") # Creating a Java JFrame
    panel = JPanel.new()
    panel.setLayout(FlowLayout.new())

    6.times { panel.add(JLabel.new("Hello there")) }

    frame.setDefaultCloseOperation(JFrame::EXIT_ON_CLOSE)
    frame.setTitle 'This is a long long title.'
    frame.add panel
    frame.pack
    frame.setVisible(true)
end
