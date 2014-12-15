import java.util.Random;

/**
 * Represents a Ferrari, which is a type of car.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Ferrari extends Car {
    private static int initSpeed = 3;

    /**
     * Creates a Ferrari at (150,150) with initial speed 3.
     */
    public Ferrari() {
        super(initSpeed);
    }

    /**
     * Moves the Ferrari in the direction specified by the character.
     *
     * @param keyPressed - specifies the direction in which to move (WASD)
     */
    public void move(char keyPressed) {
        Random r = new Random();
        int chance = r.nextInt(100);
        if (chance < 5) {
            speed++;
        }
        switch (keyPressed) {
            case 'w':
                y = y - speed;
                break;
            case 'a':
                x = x - speed;
                break;
            case 's':
                y = y + speed;
                break;
            case 'd':
                x = x + speed;
                break;
            default:
                break;
        }
    }
}
