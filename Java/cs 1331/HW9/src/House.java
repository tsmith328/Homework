import java.awt.Graphics;
import java.awt.Rectangle;
import java.util.Random;
import java.awt.Image;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;

/**
 * Represents the Great Houses of Westeros.
 * @author Tyler Smith
 * @version 1.0
 */
public abstract class House {
    protected int health, speed, age, maxAge;
    protected int x, y;
    protected Rectangle bounds;
    protected Image sigil;
    protected static Random r = new Random();
    private boolean collideCheck = true;

    /**
     * Determines whether or not the Houses can reproduce.
     *
     * @param House - the possible mate.
     * @return boolean - whether or not the two Houses can have a child.
     */
    public abstract boolean canReproduceWithHouse(House otherHouse);

    /**
     * Determines whether or not the House can destroy otherHouse.
     *
     * @param otherHouse - The House to be destroyed
     * @return boolean - whether or not the otherHouse can be destroyed.
     */
    public abstract boolean canDestroyHouse(House otherHouse);

    /**
     * Moves the House by moving it's sigil.
     */
    public void move() {
        int newX, newY;
        int signX, signY;
        this.age++;
        if (this instanceof NorthHouse) {
            ((NorthHouse) this).northBonus();
        } else if (this instanceof SouthHouse) {
            ((SouthHouse) this).southBonus();
        }
        this.health--;
        if (Math.random() > 0.5) {
            signX = -1;
        } else {
            signX = 1;
        }
        if (Math.random() > 0.5) {
            signY = -1;
        } else {
            signY = 1;
        }
        newX = x + signX * speed * r.nextInt(25);
        newY = y + signY * speed * r.nextInt(25);
        if (newX < 0 || newX > this.bounds.getWidth()) {
            x = x;
        } else {
            x = newX;
        }
        if (newY < 0 || newY > this.bounds.getHeight()) {
            y = y;
        } else {
            y = newY;
        }
    }

    /**
     * Draws the House's sigil on Westeros to show where it is.
     *
     * @param g - the graphics panel to be drawn on.
     */
    public void draw(Graphics g) {
        Image drawThis = this.sigil;
        g.drawImage(drawThis, this.x, this.y, null);
    }

    /**
     * Determines whether or not two houses are touching.
     *
     * @param otherHouse - the house that may be touching this one
     * @return boolean - whether or not they are touching
     */
    public boolean collidesWithHouse(House otherHouse) {
        if (otherHouse.equals(null)) {
            return false;
        }
        if (otherHouse == this) {
            return false;
        }
        boolean xCol = (otherHouse.x > this.x)
                && (otherHouse.x < (this.x + this.sigil.getWidth(null)));
        boolean yCol = (otherHouse.y > this.y)
                && (otherHouse.y < (this.y + this.sigil.getHeight(null)));
        boolean testOther = !(xCol && yCol) && collideCheck;
        boolean other;
        if (testOther) {
            collideCheck = !collideCheck;
            other = otherHouse.collidesWithHouse(this);
        } else {
            other = false;
        }
        if ((xCol && yCol) || other) {
            return true;
        }
        return false;
    }

    /**
     * Makes little house babies.
     *
     * @param otherHouse - the father (or mother, or mother-sister)
     * of the child house.
     * @return House - the child house produced
     */
    public House reproduceWithHouse(House otherHouse) {
        int chance = r.nextInt(100);
        if (chance > 20) {
            return null;
        }
        if (this.age < 15) {
            return null;
        }

        if (this instanceof Stark) {
            return (House) new Stark(this.x, this.y, this.bounds);
        } else if (this instanceof Tully) {
            return (House) new Tully(this.x, this.y, this.bounds);
        } else if (this instanceof Baratheon) {
            return (House) new Baratheon(this.x, this.y, this.bounds);
        } else if (this instanceof Martell) {
            return (House) new Martell(this.x, this.y, this.bounds);
        } else if (this instanceof Greyjoy) {
            return (House) new Greyjoy(this.x, this.y, this.bounds);
        } else if (this instanceof Arryn) {
            return (House) new Arryn(this.x, this.y, this.bounds);
        } else if (this instanceof Tyrell) {
            return (House) new Tyrell(this.x, this.y, this.bounds);
        } else if (this instanceof Lannister) {
            return (House) new Lannister(this.x, this.y, this.bounds);
        } else if (this instanceof Targaryan) {
            return (House) new Targaryan(this.x, this.y, this.bounds);
        } else {
            return null;
        }
    }

    /**
     * Determines if the House has grown past its max age.
     *
     * @return boolean - whether or not the House is old
     */
    public boolean isOld() {
        if (this instanceof Targaryan) {
            return false;
        }
        if (this.age >= this.maxAge) {
            return true;
        }
        return false;
    }

    /**
     * Destroys the victim House.
     *
     * @param otherHouse - the victim House
     */
    public void destroyHouse(House otherHouse) {
        otherHouse.die();
    }

    /**
     * Kills this House by setting health to zero.
     */
    public void die() {
        this.health = 0;
    }

    /**
     * Returns if the House has no health.
     *
     * @return boolean - whether or not the House is dead
     */
    public boolean isDead() {
        if (health <= 0) {
            return true;
        }
        return false;
    }

    /**
     * Gets the sigil for the House from a file.
     *
     * @return Image - the sigil of the House
     */
    protected Image getSigilFromFile() {
        String fileName = this.toString() + ".png";
        try {
            File imageFile = new File(fileName);
            Image image = ImageIO.read(imageFile);
            return image;
        } catch (IOException e) {
            String errorString = "Sigil file not found;"
                + " please verify that you have my provided image files.";
            JOptionPane.showMessageDialog(null, errorString, "No Sigil",
                    JOptionPane.ERROR_MESSAGE);
            System.exit(0);
            return null;
        }
    }
}