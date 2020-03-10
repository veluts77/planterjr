package planter.uml.renderer;

import java.awt.Image;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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
			// png = new FileOutputStream("testdata/image.png");
			// SourceStringReader reader = new SourceStringReader(_source);
			// String desc = reader.generateImage(png);
			// System.out.println(desc);
			// png.close();
			
			png = new ByteArrayOutputStream();
			SourceStringReader reader = new SourceStringReader(_source);
			String desc = reader.generateImage(png);
			System.out.println(desc);
			byte[] pngData = ((ByteArrayOutputStream) png).toByteArray();
			ByteArrayInputStream input = new ByteArrayInputStream(pngData);
			Image image = ImageIO.read(input);
			System.out.println("done");
			return image;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
