import java.awt.BorderLayout;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;


public class Test3 {
    public static void main(String[] args) {
        JFrame jf = new JFrame("My GUI");
        jf.setSize(200,200);
        JPanel jp = new JPanel();
        jp.setLayout(new BorderLayout());
        jf.getContentPane().add(jp);
        JButton jb1 = new JButton("Z");
        JButton jb2 = new JButton("Y");
        JButton jb3 = new JButton("X");
        JButton jb4 = new JButton("W");
        jp.add(jb1,BorderLayout.WEST);
        jp.add(jb2,BorderLayout.NORTH);
        jp.add(jb3,BorderLayout.SOUTH);
        jp.add(jb4,BorderLayout.EAST);
        JPanel jp2 = new JPanel();
        jp2.setLayout(new BoxLayout(jp2, BoxLayout.Y_AXIS));
        jp.add(jp2,BorderLayout.CENTER);
        
        for (int i = 0; i<3; i++) {
            jp2.add(new JLabel("widget "+i));
        }
        jf.setVisible(true);
    }
}
