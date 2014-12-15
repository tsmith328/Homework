/**
 * Represents Houses that hail from the South.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public abstract class SouthHouse extends House {
    /**
     * Determines if the House is in the South.
     *
     * @return true if the House is in the South right now
     */
    private boolean inSouth() {
        if (this.y > (Westeros.HEIGHT / 2)) {
            return true;
        }
        return false;
    }

    /**
     * Provides a speed boost to the House in the South
     */
    public void southBonus() {
        if (this.inSouth()) {
            this.speed = 3;
        } else {
            this.speed = 1;
        }
    }
}
