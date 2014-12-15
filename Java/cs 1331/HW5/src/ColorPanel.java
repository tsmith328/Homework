import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 * This class creates the JPanel in which the color chooser exists.
 * @author Tyler Smith
 * @version 1.0
 */

public class ColorPanel extends JPanel {

    private int r, g, b;
    private JButton random;
    private JTextField redVal, blueVal, greenVal;
    private JLabel red, blue, green;
    private JPanel choicePanel;
    private Random rand;
    private Color colorBox;

    /**
     * Instantiates the ColorPanel object. Sets background colors and loads the
     * GUI with labels, buttons, and fields.
     */
    public ColorPanel() {
        setBackground(Color.white);
        setPreferredSize(new Dimension(400, 300));

        rand = new Random();
        random = new JButton("Generate a random color!");

        redVal = new JTextField(4);
        greenVal = new JTextField(4);
        blueVal = new JTextField(4);
        redVal.setText("0");
        greenVal.setText("0");
        blueVal.setText("0");

        red = new JLabel("Red:");
        blue = new JLabel("Blue:");
        green = new JLabel("Green:");

        FieldListener text = new FieldListener();
        ButtonListener button = new ButtonListener();

        redVal.addActionListener(text);
        blueVal.addActionListener(text);
        greenVal.addActionListener(text);
        random.addActionListener(button);

        choicePanel = new JPanel();
        choicePanel.setBackground(Color.gray);
        choicePanel.setPreferredSize(new Dimension(400, 100));
        choicePanel.add(red);
        choicePanel.add(redVal);
        choicePanel.add(green);
        choicePanel.add(greenVal);
        choicePanel.add(blue);
        choicePanel.add(blueVal);
        choicePanel.add(random);

        add(choicePanel);
    }
    /**
     * Paints the colored box onto the GUI using the provided colors.
     *
     * @param Graphics - the page being drawn
     */
    public void paintComponent(Graphics page) {
        super.paintComponent(page);
        r = Integer.parseInt(redVal.getText());
        g = Integer.parseInt(greenVal.getText());
        b = Integer.parseInt(blueVal.getText());
        colorBox = new Color(r, g, b);
        page.setColor(colorBox);
        page.fillRect(125, 125, 150, 150);
    }

    //This class listens for button presses.
    public class ButtonListener implements ActionListener {
        /**
         * Sets the text fields to random values upon the Random
         * button being pressed, then redraws the GUI.
         *
         * @param ActionEvent - a button-press event
         */
        public void actionPerformed(ActionEvent event) {
            redVal.setText(Integer.toString(rand.nextInt(256)));
            greenVal.setText(Integer.toString(rand.nextInt(256)));
            blueVal.setText(Integer.toString(rand.nextInt(256)));

            repaint(); //repaint() forces a redraw of the paintComponent method.
        }
    }

    //This class listens for return key-strokes in the text fields.
    public class FieldListener implements ActionListener {
        /**
         * Causes the GUI to be redrawn using the new RGB values entered into
         * the text fields.
         *
         * @param ActionEvent - a return-key stroke in the text fields.
         */
        public void actionPerformed(ActionEvent event) {
            int redIn = Integer.parseInt(redVal.getText());
            int greenIn = Integer.parseInt(greenVal.getText());
            int blueIn = Integer.parseInt(blueVal.getText());
            if (redIn < 0 || redIn > 255) {
                return;
            } else if (greenIn < 0 || greenIn > 255) {
                return;
            } else if (blueIn < 0 || blueIn > 255) {
                return;
            } else {
                repaint();
            }
        }
    }
}
