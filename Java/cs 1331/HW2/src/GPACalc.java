//**********************************************************************************************
//	GPACalc.java	Author: Tyler M Smith
//					Section: CS 1331 A2
//					TAs: Andrea Fletcher and Ahmed Ismail
//					I worked on this assignment alone, using only this semester's course
//					materials.
//
//	Takes the grades a student earned and calculates the resulting GPA.
//**********************************************************************************************

import java.util.Scanner;

public class GPACalc{
	public static void main(String[] args){
		int A,B,C,D,F;
		double GPA;
		
		System.out.println("Please enter the number of each grade you earned.");
		//Gathering grade data.
		System.out.print("A: ");
		Scanner scanA = new Scanner(System.in);
		A = scanA.nextInt();

		System.out.print("B: ");
		Scanner scanB = new Scanner(System.in);
		B = scanB.nextInt();
		
		System.out.print("C: ");
		Scanner scanC = new Scanner(System.in);
		C = scanC.nextInt();
		
		System.out.print("D: ");
		Scanner scanD = new Scanner(System.in);
		D = scanD.nextInt();
		
		System.out.print("F: ");
		Scanner scanF = new Scanner(System.in);
		F = scanF.nextInt();
		
		int numClasses = A + B + C + D + F;
		//Calculating GPA.
		int total = (4 * A)+(3 * B)+(2 * C)+(1 * D);
		GPA = (double)total/numClasses;
		System.out.println("GPA: "+ GPA);
		
		scanA.close();
		scanB.close();
		scanC.close();
		scanD.close();
		scanF.close();
	}
}
