import java.awt.Graphics;
import java.util.Random;

/**
 * Represents a Car, which is a type of Vehicle.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public abstract class Boat extends Vehicle {
    /**
     * Creates a boat at (150,300) in the driving area.
     *
     * @param speed - the speed at which the boat moves
     */
    public Boat(int speed) {
        super(150, 300, speed);
    }

    /**
     * Draws the boat onto the driving area at its position.
     *
     * @param g - the Graphics object of a panel
     */
    public abstract void draw(Graphics g);

    /**
     * Moves the boat at its speed in the direction determined by the key
     * pressed. Includes jumps for Yachts.
     *
     * @param keyPressed - the character that determines direction for the
     * boat to move.
     */
    public void move(char keyPressed) {
        boolean jump;
        if (this instanceof Yacht) {
            Random r = new Random();
            if (r.nextInt(100) < 15) {
                jump = true;
            } else {
                jump = false;
            }
        } else {
            jump = false;
        }
        switch(keyPressed) {
            case 'a':
                x = x - speed;
                this.moveVert();
                if (jump) {
                    x = x - 10;
                }
                break;
            case 'd':
                x = x + speed;
                this.moveVert();
                if (jump) {
                    x = x + 10;
                }
            default:
                break;
        }
    }

    /**
     * Moves the boat vertically as a result of wind in the sails.
     */
    protected void moveVert() {
        Random r = new Random();
        int chance = r.nextInt(100);
        if (chance < 5) {
            y--;
        } else if (chance < 10) {
            y++;
        }
    }
}
