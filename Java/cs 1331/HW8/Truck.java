import java.util.Random;

/**
 * Represents a Truck, which is a type of Car.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Truck extends Car {
    private boolean isBroken = false;

    /**
     * Creates a Truck at (150,150) with speed 1;
     */
    public Truck() {
        super(1);
    }

    /**
     * Returns whether or not the truck is broken.
     *
     * @return boolean - true if truck is broken; false otherwise
     */
    public boolean getBroken() {
        return isBroken;
    }

    /**
     * Moves the Truck in the direction specified by the character.
     *
     * @param keyPressed - specifies the direction in which to move (WASD)
     */
    public void move(char keyPressed) {
        Random r = new Random();
        int chance = r.nextInt(100);
        if (chance == 0) {
            isBroken = true;
        }
        if (!isBroken) {
            switch (keyPressed) {
                case 'w':
                    y--;
                    break;
                case 'a':
                    x--;
                    break;
                case 's':
                    y++;
                    break;
                case 'd':
                    x++;
                    break;
                default:
                    break;
            }
        }
    }
}
