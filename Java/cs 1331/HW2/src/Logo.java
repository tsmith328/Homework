//**********************************************************************************************
//	Logo.java		Author: Tyler M Smith
//					Section: CS 1331 A2
//					TAs: Andrea Fletcher and Ahmed Ismail
//					I worked on this assignment alone, using only this semester's course
//					materials.
//
//	Displays the new logo of the Atlanta Silverbacks.
//**********************************************************************************************

import javax.swing.JApplet;
import java.awt.*;

public class Logo extends JApplet{
	public void paint(Graphics logo){
		final int width = 500;
		final int height = 500;
		final int rad = (width/3);
		int fontSize = height/10;
		
		//Set background to green field
		Color field = new Color(34,139,34);
		logo.setColor(field);
		logo.fillRect(0, 0, width, height);
		
		//Create white ball
		logo.setColor(Color.white);
		logo.fillOval(width/3, height/3, rad, rad);
		
		//Create outline of ball
		Color outLine = new Color(180,180,180);
		logo.setColor(outLine);
		logo.drawOval(width/3, height/3, rad,rad);
		
		//Print text
		Font title = new Font("Title",Font.BOLD+Font.ITALIC, fontSize);
		logo.setFont(title);
		logo.drawString("Atlanta", width/2-60, (height/2)-100);
		logo.drawString("Silverbacks", (width/2)-130, (height/2) + 120);
		
		//Prints underlines
		logo.drawLine(width/2-60, height/2-100, width/2+110, height/2-100);
		logo.drawLine(width/2-130, height/2 + 120, width/2 + 140, height/2 + 120);
		
	}
}
