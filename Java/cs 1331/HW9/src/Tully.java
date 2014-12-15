import java.awt.Rectangle;

/**
 * Represents the Tullys of Riverrun.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Tully extends NorthHouse {
    public Tully(int x, int y, Rectangle bounds) {
        this.x = x;
        this.y = y;
        this.bounds = bounds;
        this.health = 100;
        this.maxAge = 250;
        this.age = 0;
        this.speed = 1;
        this.sigil = this.getSigilFromFile();
    }

    /**
     * Returns the name of the Tully sigil
     *
     * @return String - the name of the Tully sigil
     */
    public String toString() {
        return "trout";
    }

    /**
     * Determines if the House can reproduce with another.
     *
     * @param House - the possible other parent House
     * @return true if they can reproduce, false otherwise
     */
    public boolean canReproduceWithHouse(House otherHouse) {
        if (otherHouse instanceof Stark) {
            return true;
        }
        if (otherHouse instanceof Arryn) {
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
        if (otherHouse instanceof Lannister && Math.random() > 0.2) {
            return true;
        }
        return false;
    }
}
