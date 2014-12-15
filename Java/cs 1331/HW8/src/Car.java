import java.awt.Graphics;
import java.awt.Image;

/**
 * Represents a Car, which is a type of Vehicle.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public abstract class Car extends Vehicle {
    /**
     * Creates a car at (150,150) in the driving area.
     *
     * @param speed - the speed the car should move at
     */
    public Car(int speed) {
        super(150, 150, speed);
    }

    /**
     * Draws the Car at its position on the driving area.
     *
     * @param g - the Graphics object of a panel.
     */
    public void draw(Graphics g) {
        Image pic;
        if (this instanceof Truck) {
            pic = ImageReader.getImageFromFileName("truck.jpg");
            if (((Truck) this).getBroken()) {
                g.drawString("He's dead, Jim! x.x", x, y - 10);
            }
        } else {
            pic = ImageReader.getImageFromFileName("ferrari.jpg");
        }
        g.drawImage(pic, x, y, null);
    }

    /**
     * Moves the Car in the direction specified by the character.
     *
     * @param keyPressed - specifies the direction in which to move (WASD)
     */
    public abstract void move(char keyPressed);

}
