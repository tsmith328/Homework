import java.util.Scanner;

/**
* This class contains the main method that runs the Hawaii name checker.
* @author Tyler Smith
* @version 1.0
*/

public class HawaiiDriver {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String ans;
        do {
            System.out.println("Please enter your name to see if it's "
                    + "Hawaiian.");
            String name = scan.nextLine();
            String lowerName = name.toLowerCase();
            //Tests the name with lower-case letters for ease.
            if (Hawaii.isHawaiian(lowerName)) {
                String greeting = Hawaii.getGreeting();
                System.out.println(greeting + name + "!");
            } else {
                System.out.println("Sorry, " + name
                    + ", you aren't Hawaiian enough to come!");
                String newName = Hawaii.makeName(lowerName);
                System.out.println("Let's make your name... " + newName + "!");
                String newGreet = Hawaii.getGreeting();
                System.out.println(newGreet + newName + "!");
            }
            System.out.println("Would you like to try again? (y/n)");
            ans = scan.nextLine();
        } while (ans.equalsIgnoreCase("y")); //Test to try again.
        scan.close();
    }
}