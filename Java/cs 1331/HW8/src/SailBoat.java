import java.awt.Color;
import java.awt.Graphics;
import java.awt.Polygon;

/**
 * Represents a SailBoat, which is a type of Boat.
 * @author Tyler Smith
 * @version 1.0
 */
public class SailBoat extends Boat {
    private static int speed = 1;

    /**
     * Creates a SailBoat at (150,300) and speed 1.
     */
    public SailBoat() {
        super(speed);
    }

    /**
     * Draws the SailBoat at its position on the driving area.
     *
     * @param g - The Graphics object of a panel
     */
    public void draw(Graphics g) {
        int topLeftX = x - 25;
        int topLeftY = y - 15;
        g.setColor(Color.black);
        g.fillRect(topLeftX, topLeftY, 50, 30);
        g.setColor(Color.yellow);
        g.drawString("S", x, topLeftY + 15);
        g.setColor(Color.red);

        int[] xArr = new int[3];
        xArr[0] = topLeftX + 12;
        xArr[1] = x;
        xArr[2] = x + 13;

        int[] yArr = new int[3];
        yArr[0] = topLeftY;
        yArr[2] = topLeftY;
        yArr[1] = topLeftY - 10;

        Polygon p = new Polygon(xArr, yArr, 3);
        g.fillPolygon(p);
    }
}
