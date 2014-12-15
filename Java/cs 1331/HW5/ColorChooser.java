import javax.swing.JFrame;

/**
 * This class creates a GUI that allows the user to enter RGB
 * values and view that color.
 * @author Tyler Smith
 * @version 1.0
 */
public class ColorChooser {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Color Chooser");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        ColorPanel panel = new ColorPanel();

        frame.getContentPane().add(panel);
        frame.pack();
        frame.setVisible(true);
    }
}
