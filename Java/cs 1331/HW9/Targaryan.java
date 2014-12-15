import java.awt.Rectangle;

/**
 * Represents the exiled Targaryans.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Targaryan extends House {
    /**
     * Creates a Targaryan at (x,y).
     *
     * @param x - the x-coordinate of the position
     * @param y - the y-coordinate of the position
     * @param bounds - the limits of Westeros
     */
    public Targaryan(int x, int y, Rectangle bounds) {
        this.x = x;
        this.y = y;
        this.bounds = bounds;
        this.health = 100;
        this.age = 0;
        this.maxAge = 0; //just to avoid any null pointer exceptions
        this.speed = 4;
        this.sigil = this.getSigilFromFile();
    }

    /**
     * Returns the name of the sigil.
     *
     * @return String - the name of the sigil
     */
    public String toString() {
        return "dragon";
    }

    /**
     * Determines if the House can reproduce with another
     *
     * @param House - the possible parent
     * @return true if they can reproduce, false otherwise
     */
    public boolean canReproduceWithHouse(House otherHouse) {
        if (otherHouse instanceof Targaryan && Math.random() < 0.25) {
            return true;
        }
        return false;
    }

    /**
     * Determines if the House can destroy another.
     *
     * @param House - the possible victim
     * @return true if if can destroy the other house
     */
    public boolean canDestroyHouse(House otherHouse) {
        if (otherHouse instanceof Baratheon) {
            return false;
        }
        if (otherHouse instanceof Targaryan) {
            return false;
        }
        return true;
    }
}
