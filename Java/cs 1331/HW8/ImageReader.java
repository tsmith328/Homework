import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

/**
 *
 * @author Keagan
 *
 * Utility class that can get and Image from a filename
 */
public class ImageReader {
    /**
     *
     * @param fileName the string name of the file
     * @return an Image that was created from the file
     */
    public static Image getImageFromFileName(String fileName) {
        BufferedImage image;
        try {
            image = ImageIO.read(new File(fileName));
            return image;
        } catch (IOException ex) {
            return null;
        }
    }
}