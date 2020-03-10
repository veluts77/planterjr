class TestRenderer
    include_package 'planter.uml.renderer'

    def run
        renderer = PngRenderer.new('class NiceRuby')
        image = renderer.getRenderedImage()
        puts image
    end
end
