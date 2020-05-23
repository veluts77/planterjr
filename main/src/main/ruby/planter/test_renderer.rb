# frozen_string_literal: true

class TestRenderer
  include_package 'planter.file'
  include_package 'planter.uml.renderer'

  def run
    renderer = PngRenderer.new('class NiceRuby')
    image = renderer.getRenderedImage
    saver = ImageSaver.new image
    saver.save 'generated.png'
  end
end
