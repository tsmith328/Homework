import java.awt.Rectangle;

/**
 * Represents the Baratheons of Storm's End.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Baratheon extends House {
    /**
     * Creates an Baratheon at (x,y)
     * @param x - the x-coordinate of the House
     * @param y - the y-coordinate of the House
     * @param bounds - the limits of Westeros
     */
    public Baratheon(int x, int y, Rectangle bounds) {
        this.x = x;
        this.y = y;
        this.bounds = bounds;
        this.health = 100;
        this.maxAge = 150;
        this.age = 0;
        this.speed = 1;
        this.sigil = this.getSigilFromFile();
    }

    /**
     * Returns the name of the Baratheon sigil
     *
     * @return String - the name of the Baratheon sigil
     */
    public String toString() {
        return "stag";
    }

    /**
     * Determines if the House can reproduce with another.
     *
     * @param House - the possible other parent House
     * @return true if they can reproduce, false otherwise
     */
    public boolean canReproduceWithHouse(House otherHouse) {
        if (otherHouse instanceof Lannister) {
            return true;
        }
        if (otherHouse instanceof Tyrell) {
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
        if (otherHouse instanceof Targaryan) {
            return true;
        }
        return false;
    }
}
