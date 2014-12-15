import java.awt.Rectangle;

/**
 * Represents House Tyrell of Highgarden.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Tyrell extends SouthHouse {
    public Tyrell(int x, int y, Rectangle bounds) {
        this.x = x;
        this.y = y;
        this.bounds = bounds;
        this.health = 100;
        this.age = 0;
        this.maxAge = 180;
        this.speed = 2;
        this.sigil = this.getSigilFromFile();
    }

    /**
     * Returns the name of Tyrell's sigil.
     *
     * @return String - the sigil name
     */
    public String toString() {
        return "rose";
    }

    /**
     * Determines who Tyrell can reproduce with
     *
     * @param otherHouse - the other parent House
     * @return boolean - whether or not they can reproduce
     */
    public boolean canReproduceWithHouse(House otherHouse) {
        if (Math.random() > 0.25) {
            return false;
        }
        if (otherHouse instanceof Lannister) {
            return true;
        }
        if (otherHouse instanceof Baratheon) {
            return true;
        }
        return false;
    }

    /**
     * Determines who Tyrell can destroy.
     *
     * @return boolean - false always: Tyrells cannot kill
     */
    public boolean canDestroyHouse(House otherHouse) {
        return false;
    }
}
