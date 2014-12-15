import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.Dimension;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

/**
 * This is the ControlPanel for Game of Thrones. It allows the
 * user to pick which House it would like to add next.
 *
 * Edited by Tyler Smith to add extra houses.
 * @author Sundeep, Ethan
 * @version 1.0
 */
public class ControlPanel extends JPanel {
    private JButton stark, baratheon, lannister, tully, targaryan;
    private JButton arryn, greyjoy, tyrell, martell; //Added by Tyler
    private JLabel current;

    private String houseType;

    public ControlPanel() {
        setPreferredSize(new Dimension(150, Westeros.HEIGHT));

        stark = new JButton("Stark");
        stark.addActionListener(new ButtonListener("Stark"));
        add(stark);

        baratheon = new JButton("Baratheon");
        baratheon.addActionListener(new ButtonListener("Baratheon"));
        add(baratheon);

        lannister = new JButton("Lannister");
        lannister.addActionListener(new ButtonListener("Lannister"));
        add(lannister);

        targaryan = new JButton("Targaryan");
        targaryan.addActionListener(new ButtonListener("Targaryan"));
        add(targaryan);

        tully = new JButton("Tully");
        tully.addActionListener(new ButtonListener("Tully"));
        add(tully);

        arryn = new JButton("Arryn");
        arryn.addActionListener(new ButtonListener("Arryn"));
        add(arryn);

        greyjoy = new JButton("Greyjoy");
        greyjoy.addActionListener(new ButtonListener("Greyjoy"));
        add(greyjoy);

        tyrell = new JButton("Tyrell");
        tyrell.addActionListener(new ButtonListener("Tyrell"));
        add(tyrell);

        martell = new JButton("Martell");
        martell.addActionListener(new ButtonListener("Martell"));
        add(martell);

        //default starting animal
        houseType = "Stark";
        add(new JLabel("Current Animal"));
        current = new JLabel("Stark");
        add(current);

        //implement timer speed control if you feel adventurous
    }

    /**
     * Invoked by GoTPanel to determine which House
     * was chosen
     *
     * @return The currently selected House type
     */
    public String getHouseType() {
        return houseType;
    }

    public class ButtonListener implements ActionListener {
        private String name;

        public ButtonListener(String className) {
            name = className;
        }

        public void actionPerformed(ActionEvent e) {
            houseType = name;
            current.setText(name);
        }
    }
}
