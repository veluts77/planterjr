package planter.uml.renderer;

import java.awt.Image;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import net.sourceforge.plantuml.SourceStringReader;

public class PngRenderer extends ARenderer {

	public PngRenderer(String str) {
		super(str);
	}

	@Override
	protected Image createImage() {
		OutputStream png;
		try {
			png = new ByteArrayOutputStream();
			SourceStringReader reader = new SourceStringReader(_source);
			reader.outputImage(png);
			byte[] pngData = ((ByteArrayOutputStream) png).toByteArray();
			ByteArrayInputStream input = new ByteArrayInputStream(pngData);
			Image image = ImageIO.read(input);
			return image;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
