package planter.clipboard;

import java.awt.*;
import java.awt.datatransfer.*;
import java.io.*;

/**
 * Supportive class for copying an image into a clipboard
 */
public class ImageSelection implements Transferable {
    private Image image;

    public ImageSelection(Image image) {
        this.image = image;
    }

    public DataFlavor[] getTransferDataFlavors() {
        return new DataFlavor[] { DataFlavor.imageFlavor };
    }

    public boolean isDataFlavorSupported(DataFlavor flavor) {
        return DataFlavor.imageFlavor.equals(flavor);
    }

    public Object getTransferData(DataFlavor flavor) throws UnsupportedFlavorException, IOException {
        if (isDataFlavorSupported(flavor)) {
            return image;
        } else {
            throw new UnsupportedFlavorException(flavor);
        }
    }
}
