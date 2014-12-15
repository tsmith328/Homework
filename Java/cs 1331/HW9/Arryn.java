import java.awt.Rectangle;

/**
 * Represents the Arryns of the Eyrie.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Arryn extends House {
    /**
     * Creates an Arryn at (x,y)
     * @param x - the x-coordinate of the House
     * @param y - the y-coordinate of the House
     * @param bounds - the limits of Westeros
     */
    public Arryn(int x, int y, Rectangle bounds) {
        this.x = x;
        this.y = y;
        this.bounds = bounds;
        this.health = 100;
        this.age = 0;
        this.maxAge = 90;
        this.speed = 2;
        this.sigil = this.getSigilFromFile();
    }

    /**
     * Returns the name of the Arryn sigil
     *
     * @return String - the name of the Arryn sigil
     */
    public String toString() {
        return "falcon";
    }

    /**
     * Determines if the House can reproduce with another.
     *
     * @param House - the possible other parent House
     * @return true if they can reproduce, false otherwise
     */
    public boolean canReproduceWithHouse(House otherHouse) {
        if (otherHouse instanceof Tully) {
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
        if (otherHouse instanceof Martell) {
            return true;
        }
        return false;
    }
}
