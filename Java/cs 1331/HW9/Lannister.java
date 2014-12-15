import java.awt.Rectangle;

/**
 * Represents the Lannisters of Caterly Rock.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Lannister extends SouthHouse {
    /**
     * Places a Lannister at (x,y)
     *
     * @param x - the x-coordinate of the House
     * @param y - the y-coordinate of the House
     * @param bounds - the limits of Westeros
     */
    public Lannister(int x, int y, Rectangle bounds) {
        this.x = x;
        this.y = y;
        this.bounds = bounds;
        this.health = 100;
        this.maxAge = 100;
        this.age = 0;
        this.speed = 2;
        this.sigil = this.getSigilFromFile();
    }

    /**
     * Returns the name of Lannister's sigil
     *
     * @return String - the name of the sigil
     */
    public String toString() {
        return "lion";
    }

    /**
     * Determines if the House can reproduce with another.
     *
     * @param House - the possible other parent House
     * @return true if they can reproduce, false otherwise
     */
    public boolean canReproduceWithHouse(House otherHouse) {
        if (otherHouse instanceof Baratheon) {
            return true;
        }
        if (otherHouse instanceof Lannister) {
            return true;
        }
        return false;
    }

    /**
     * Determines if this house can destroy another.
     * @param House - the victim house
     * @return true if the other house can be destroyed, false otherwise
     */
    public boolean canDestroyHouse(House otherHouse) {
        if (otherHouse instanceof Stark) {
            if (Math.random() > 0.6) {
                return true;
            }
            return false;
        }
        if (otherHouse instanceof Tully) {
            if (Math.random() > 0.8) {
                return true;
            }
        }
        if (otherHouse instanceof Arryn) {
            if (Math.random() > 0.333) {
                return true;
            }
        }
        return false;
    }
}
