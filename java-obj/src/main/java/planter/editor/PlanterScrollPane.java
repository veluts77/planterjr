package planter.editor;

import org.fife.ui.rtextarea.*;

public class PlanterScrollPane {
    private RTextScrollPane scrollPane;

    public PlanterScrollPane(RSyntaxPlanterEditor editor) {
        scrollPane = new RTextScrollPane(editor.getSwing());
    }

    public RTextScrollPane getSwing() {
        return scrollPane;
    }
}
