import java.awt.Rectangle;

/**
 * Represents the Starks of Winterfell.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Stark extends NorthHouse {
    /**
     * Creates a Stark at (x,y)
     *
     * @param x - the x-coordinate of the house
     * @param y - the y-coordinate
     * @param bounds - the limits of Westeros
     */
    public Stark(int x, int y, Rectangle bounds) {
        this.x = x;
        this.y = y;
        this.bounds = bounds;
        this.health = 100;
        this.age = 0;
        this.speed = 1;
        this.maxAge = 200;
        this.sigil = this.getSigilFromFile();
    }

    /**
     * Determines if the House can destroy another
     *
     * @param House - the possible victim
     * @return true if the House is destroyable
     */
    public boolean canDestroyHouse(House otherHouse) {
        int killChance = r.nextInt(100);
        if (otherHouse instanceof Lannister) {
            if (killChance < 40) {
                return true;
            }
            return false;
        }
        return false;
    }

    /**
     * Determines if the House can reproduce with another
     *
     * @param House - the possible mate
     * @return true if the Houses can reproduce
     */
    public boolean canReproduceWithHouse(House otherHouse) {
        if (otherHouse instanceof Tully) {
            return true;
        }
        return false;
    }

    public String toString() {
        return "direwolf";
    }
}
