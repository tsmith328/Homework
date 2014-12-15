import javax.swing.JFrame;

/**
 * Allows you to drive a vehicle of your choice around a driving area.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class Driving {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Driving Driving Driving");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        DrivingPanel drive = new DrivingPanel();

        frame.getContentPane().add(drive);
        frame.pack();
        frame.setVisible(true);
    }
}