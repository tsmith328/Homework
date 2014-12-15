import java.awt.Graphics;
/**
 *
 * @author Keagan
 *
 * Represents a Vehicle
 */
public abstract class Vehicle {
    protected int x;
    protected int y;
    protected int speed;

    public Vehicle(int x, int y, int speed) {
        this.x = x;
        this.y = y;
        this.speed = speed;
    }
    /**
     * Draws the vehicle on the GUI using the Graphics object passed in.
     * This is an abstract method that must be overriden.
     *
     * @param g the Graphics object of a particular panel
     */
    public abstract void draw(Graphics g);
    /**
     * Moves the vehicle's position.
     * This is an abstract method that must be overriden.
     *
     * @param keyPressed the char representing which keyboard key was pressed
     */
    public abstract void move(char keyPressed);
}