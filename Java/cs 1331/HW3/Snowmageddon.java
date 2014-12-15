import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JApplet;
import java.util.Random;


public class Snowmageddon extends JApplet {
    public void paint(Graphics atlanta) {
        final int width = getWidth();
        final int height = getHeight();
        Random rand = new Random();

        atlanta.setColor(Color.black);
        atlanta.fillRect(0, 0, width, height);

        for (int i = 0; i <= 15; i++) {
            int red = rand.nextInt(255);
            int green = rand.nextInt(255);
            int blue = rand.nextInt(255);
            Color bColor = new Color(red, green, blue);

            atlanta.setColor(bColor);
            int high = 100 + rand.nextInt(500);
            atlanta.fillRect(i * 150, height - high, 150, high);
        }

        atlanta.setColor(Color.white);

        for (int j = 0; j <= 20; j++) {
            int radius = 5 + rand.nextInt(5);
            int randX = rand.nextInt(width);
            int randY = rand.nextInt(height);

            atlanta.fillOval(randX, randY, radius, radius);
        }
    }
}
