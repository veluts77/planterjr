package planter.clipboard;

import java.awt.*;
import java.awt.datatransfer.*;

/**
 * Clipboard abstraction to be used in JRuby code
 */
public class PlanterClipboard implements ClipboardOwner {

    public void copyImage(Image bi)
    {
        ImageSelection selection = new ImageSelection(bi);
        Clipboard c = Toolkit.getDefaultToolkit().getSystemClipboard();
        c.setContents( selection, this );
    }

    @Override
    public void lostOwnership(Clipboard clipboard, Transferable contents) {}
}
