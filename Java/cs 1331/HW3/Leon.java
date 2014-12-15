import java.awt.Color;
import java.awt.Graphics;
import java.awt.Font;
import javax.swing.JApplet;
import java.util.Random;

/*
 *  Tyler M Smith
 *  CS 1331 Homework 3
 *  Section A2
 *  TAs: Andrea Fletcher and Ahmed Ismail
 */

public class Leon extends JApplet {
    public void paint(Graphics atlanta) {
        int width = getWidth();
        int height = getHeight();
        Random rand = new Random();

        atlanta.setColor(Color.black);
        atlanta.fillRect(0, 0, width, height);

        for (int i = 0; i <= 15; i++) {
            int red = rand.nextInt(256);
            int green = rand.nextInt(256);
            int blue = rand.nextInt(256);
            Color bColor = new Color(red, green, blue);

            atlanta.setColor(bColor);
            int high = 100 + rand.nextInt(501);
            atlanta.fillRect(i * 150, height - high, 150, high);
        }

        atlanta.setColor(Color.white);

        for (int j = 0; j <= 500; j++) {
            int radius = 5 + rand.nextInt(6);
            int randX = rand.nextInt(width);
            int randY = rand.nextInt(height);

            atlanta.fillOval(randX, randY, radius, radius);

        atlanta.setColor(Color.white);
        Font nameFont = new Font("Freestyle Script", Font.PLAIN, 72);
        atlanta.setFont(nameFont);
        atlanta.drawString("Tyler Smith", 10, height - 70);
        }
    }
}
