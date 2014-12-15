import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.JButton;
import javax.swing.JPanel;

/**
 * A panel which holds the driving area and choice buttons.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class DrivingPanel extends JPanel {

    private JButton ferrariButton;
    private JButton truckButton;
    private JButton yachtButton;
    private JButton sailButton;
    private Vehicle vehicle;
    private int i;

    private boolean firstTime = true;
    private KeyListener keys;

    /**
     * Creates the panel in which the buttons are and the vehicles drive.
     */
    public DrivingPanel() {
        setBackground(Color.WHITE);
        setPreferredSize(new Dimension(500, 500));

        ferrariButton = new JButton("Ferrari");
        truckButton = new JButton("Truck");
        yachtButton = new JButton("Yacht");
        sailButton = new JButton("Sail Boat");

        ButtonListener button = new ButtonListener();
        keys = new KeysListener();

        ferrariButton.addActionListener(button);
        ferrariButton.setFocusable(false);
        truckButton.addActionListener(button);
        truckButton.setFocusable(false);
        sailButton.addActionListener(button);
        sailButton.setFocusable(false);
        yachtButton.addActionListener(button);
        yachtButton.setFocusable(false);
        this.setFocusable(true);
        this.addKeyListener(keys);

        add(ferrariButton);
        add(truckButton);
        add(sailButton);
        add(yachtButton);
    }

    /**
     * Redraws the driving area, updating vehicles and positions.
     *
     * @param page - a Graphics object in the panel
     */
    public void paintComponent(Graphics page) {
        super.paintComponent(page);
        try {
            vehicle.draw(page);
        } catch (java.lang.NullPointerException e) {
            //I need an empty block here. Don't hurt me!
            i = 324329;
        }
    }

    /**
     * Listens for button presses on the choice buttons.
     *
     * @author Tyler Smith
     * @version 1.0
     */
    private class ButtonListener implements ActionListener {
        //Is called at button press
        public void actionPerformed(ActionEvent e) {
            JButton source = (JButton) e.getSource();
            if (source == ferrariButton) {
                vehicle = new Ferrari();
            } else if (source == truckButton) {
                vehicle = new Truck();
            } else if (source == yachtButton) {
                vehicle = new Yacht();
            } else {
                vehicle = new SailBoat();
            }
            repaint();
        }
    }

    /**
     * Listens for keys being typed and moves the active vehicle.
     *
     * @author Tyler Smith
     * @version 1.0
     */
    private class KeysListener implements KeyListener {
        //Called when a letter is typed.
        public void keyTyped(KeyEvent e) {
            char key = e.getKeyChar();
            try {
                vehicle.move(key);
            } catch (java.lang.NullPointerException de) {
                //I need an empty block here. Don't hurt me!
                i = 324329;
            }
            repaint();
        }

        public void keyPressed(KeyEvent e) { }
        public void keyReleased(KeyEvent e) { }
    }
}
