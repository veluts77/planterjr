package planter.file;

import java.io.File;
import java.io.IOException;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

public class ImageSaver {
    protected BufferedImage image;

    public ImageSaver(final BufferedImage image) {
        this.image = image;
    }

    public void save(final String filename) throws IOException {
        ImageIO.write(image, "png", new File(filename));
    }
}
