import java.awt.Rectangle;

/**
 * Represents the Greyjoys of the Iron Islands
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Greyjoy extends NorthHouse {
    /**
     * Creates an Greyjoy at (x,y)
     * @param x - the x-coordinate of the House
     * @param y - the y-coordinate of the House
     * @param bounds - the limits of Westeros
     */
    public Greyjoy(int x, int y, Rectangle bounds) {
        this.x = x;
        this.y = y;
        this.bounds = bounds;
        this.health = 100;
        this.age = 0;
        this.maxAge = 75;
        this.speed = 3;
        this.sigil = this.getSigilFromFile();
    }

    /**
     * Returns the name of the Greyjoy sigil
     *
     * @return String - the name of the Greyjoy sigil
     */
    public String toString() {
        return "kraken";
    }

    /**
     * Determines if the House can reproduce with another.
     *
     * @param House - the possible other parent House
     * @return true if they can reproduce, false otherwise
     */
    public boolean canReproduceWithHouse(House otherHouse) {
        return false;
    }

    /**
     * Determines if this house can destroy another.
     * @param House - the victim house
     * @return true if the other house can be destroyed, false otherwise
     */
    public boolean canDestroyHouse(House otherHouse) {
        if (otherHouse instanceof Stark) {
            if (Math.random() > .25) {
                return true;
            }
        }
        return false;
    }
}
