import java.awt.Color;
import java.awt.Graphics;

/**
 * Represents a Yacht, which is a Boat.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Yacht extends Boat {
    private static final int SPEED = 2;

    /**
     * Creates a Yacht at (150,300) with speed 2.
     */
    public Yacht() {
        super(SPEED);
    }

    /**
     * Draws the Yacht onto the driving field at its position.
     *
     * @param g - the Graphics object of a panel
     */
    public void draw(Graphics g) {
        int topLeftX = x - 25;
        int topLeftY = y - 15;
        g.setColor(Color.black);
        g.fillRect(topLeftX, topLeftY, 50, 30);
        g.setColor(Color.yellow);
        g.drawString("Y", x, topLeftY + 15);
    }
}
