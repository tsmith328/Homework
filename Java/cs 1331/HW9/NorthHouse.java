/**
 * Represents Houses the hail from the North of Westeros
 *
 * @author Tyler Smith
 * @version 1.0
 */
public abstract class NorthHouse extends House {
    /**
     * Determines if the House is in the North.
     *
     * @return true if the House is in the North, false otherwise
     */
    private boolean inNorth() {
        if (this.y <= (Westeros.HEIGHT / 2)) {
            return true;
        }
        return false;
    }

    /**
     * Gives a health bonus to Northern Houses in the North
     */
    public void northBonus() {
        if (this.inNorth()) {
            this.health += 5;
        }
    }
}
