import java.util.Scanner;
import java.text.DecimalFormat;

/**
 * This class runs the Family Planning simulator, which returns the
 * statistics on families who are trying to have at least one boy and one girl.
 *
 * @author Tyler Smith
 * @version 1.0
 */

public class FamilyPlanning {
    public static void main(String[] args) {
        int total, max, totBoys, totGirls;
        String ans;
        Scanner scan = new Scanner(System.in);
        do {
            System.out.println("Welcome to the Family Simulator! "
                    + "How many families should I simulate?");
            int families = scan.nextInt();
            while (families <= 0) { //Checks the entered number as positive.
                System.out.println("Please enter a positive integer.");
                families = scan.nextInt();
            }
            System.out.println("Simulating families...\n");
            String order;
            int famNum = 1;
            total = 0;
            totBoys = 0;
            totGirls = 0;
            max = 0;
            do {
                order = Integer.toString(famNum) + " - ";
                Family fam = new Family();
                int boys = fam.getBoys();
                int girls = fam.getGirls();
                do {
                    String kid = fam.haveKid();
                    order += kid;
                    boys = fam.getBoys();
                    girls = fam.getGirls();
                } while (boys == 0 || girls == 0);
                System.out.println(order);
                famNum++;
                if (max < fam.getTotal()) {
                    max = fam.getTotal();
                }
                total += fam.getTotal();
                totBoys += fam.getBoys();
                totGirls += fam.getGirls();
            } while (famNum <= families);
            DecimalFormat avg = new DecimalFormat("0.###");
            String done = "\nThe average number of children was "
                    + avg.format(((double) total) / families)
                    + " and maximum was " + Integer.toString(max)
                    + ".\nA total of " + Integer.toString(totBoys)
                    + " boys and " + Integer.toString(totGirls)
                    + " girls were born.\n";
            System.out.println(done);
            //System.out.println(Family.count + " families were created.");
            String question = "Would you like to run another simulation? (y/n)";
            System.out.println(question);
            ans = scan.next();
        } while (ans.equalsIgnoreCase("y") || ans.equalsIgnoreCase("yes"));
        scan.close();
    }
}