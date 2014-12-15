import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.DefaultListModel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;




/**
 * PreviewListPanel
 *
 * Panel which takes in a set of Previewable files and
 * displays them in a JScrollPane.
 *
 * Can notify listeners of when a Previewable file is
 * selected. Only allows single selection.
 *
 * Changelog:
 * -1.0.1   Added more detailed Javadocs for students.
 *
 * @author David Leber
 * @version 1.0.1 2/26/2014
 *
 */
public class PreviewListPanel extends JPanel {

    private DefaultListModel<Previewable> list;
    private JList<Previewable> jList;
    private JScrollPane scroll;
    private ActionListener listener;

    /**
     *Constructs a PreviewListPanel, just as a standard JPanel constructor.
     */
    public PreviewListPanel() {

        this.setLayout(new GridBagLayout());
        GridBagConstraints constraintsScroll = new GridBagConstraints();
        constraintsScroll.fill = GridBagConstraints.BOTH;
        constraintsScroll.weightx = 1;
        constraintsScroll.weighty = 1;
        constraintsScroll.insets = new Insets(20, 20, 20, 20);


        list = new DefaultListModel<Previewable>();
        jList = new JList<Previewable>(list);
        jList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        jList.setLayoutOrientation(JList.HORIZONTAL_WRAP);
        jList.addMouseListener((new PreviewListener()));

        scroll = new JScrollPane(jList);
        this.add(scroll, constraintsScroll);
    }

    /**
     * Adds a Previewable to the list displayed on this PreviewListPanel.
     *
     * @param item The item to be added to the list. Must implement Previewable.
     */
    public void addItem(Previewable item) {
        list.addElement(item);
    }

    /**
     * addActionListener(ActionListener listener)
     *
     * Allows an ActionListener to listen for highlight events.
     * Notifies listeners when the user changes the highlighted item.
     *
     * @param listener An ActionListener to notify.
     */
    public void addActionListener(ActionListener listener) {
        this.listener = listener;
    }

    private class PreviewListener extends MouseAdapter {

        public void mouseClicked(MouseEvent e) {
            if (listener == null) {
                return;
            }
            Previewable clicked = ((JList<Previewable>) e.getSource()).getSelectedValue();
            listener.actionPerformed(new ActionEvent(clicked, 0, ""));
        }
    }
}
