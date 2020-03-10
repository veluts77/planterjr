package planter.uml.renderer;

import java.awt.Image;

public abstract class ARenderer {

	protected String _source;
	protected Image _image;
	
	public ARenderer(String str) {
		StringBuffer sb = new StringBuffer();
		if (!str.startsWith("@startuml")) {
			sb.append("@startuml\n");
		}
		sb.append(str);
		if (!str.endsWith("@enduml")) {
			sb.append("\n@enduml\n");
		}
		_source = sb.toString();
	}
	
	public Image getRenderedImage() {
		if (_image == null) {
			_image = createImage();
		}
		return _image;
	}
	
	protected abstract Image createImage();
}
 