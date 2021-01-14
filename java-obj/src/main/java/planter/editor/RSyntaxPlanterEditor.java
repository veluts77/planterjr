package planter.editor;

import org.fife.ui.rsyntaxtextarea.*;
import javax.swing.event.CaretListener;
import javax.swing.text.Document;

import java.awt.Font;
import java.awt.event.KeyListener;

/**
 * Wraps RSyntaxTextArea mirorring some useful methods.
 * <p/>
 * The class doesn't seem to be very useful but JRuby cannot manage correctly
 * using tab size changing using Document::putProperty method (due to Long ->
 * Integer implicit conversion).
 */
public class RSyntaxPlanterEditor {
    private RSyntaxTextArea editor;
    

    public RSyntaxPlanterEditor() {
        editor = new RSyntaxTextArea();
        editor.setSyntaxEditingStyle(SyntaxConstants.SYNTAX_STYLE_JAVA);
        editor.setCodeFoldingEnabled(true);
    }

    public RSyntaxTextArea getSwing() {
        return editor;
    }

    public void setTabSize(Long size) {
        Document doc = editor.getDocument();
        doc.putProperty("tabSize", size.intValue());
    }

    public void setFont(final Font font) {
        editor.setFont(font);
    }

    public void copy() {
        editor.copy();
    }

    public void cut() {
        editor.cut();
    }

    public void paste() {
        editor.paste();
    }

    public void addKeyListener(final KeyListener Listener) {
        editor.addKeyListener(Listener);
    }

    public void addCaretListener(final CaretListener listener) {
        editor.addCaretListener(listener);
    }
}
