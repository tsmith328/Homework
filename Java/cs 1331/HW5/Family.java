/**
 * This class creates a Family object that can have children and returns
 * the sex, number of boys, number of girls, and number to total children had.
 *
 * @author Tyler Smith
 * @version 1.0
 */

public class Family {
    private int totalKids, sex;
    private double kid;
    //public static int count = 0;
    private int boys, girls;

    /**
     * This method instantiates the Family object, preparing it to have children
     * and report data about itself.
     */
    public Family() {
        //count += 1;
        totalKids = 0;
        boys = 0;
        girls = 0;
    }
    /**
     * This method simulates the birth of a child, determining the sex.
     *
     * @return String - whether the child is a "B"oy or a "G"irl.
     */
    public String haveKid() {
        kid = Math.random();
        sex = (int) Math.round(kid);
        if (sex == 0) {
            addBoy(); //Increment the number of boys born
            return "B";
        } else {
            addGirl(); //Increment the number of girls born
            return "G";
        }
    }
    /**
     * This method determines the number of boys and girls born.
     *
     * @return int - the total number of children born to the family.
     */
    public int getTotal() {
        totalKids = boys + girls;
        return totalKids;
    }
    /**
     * This method gets the number of boys born.
     *
     * @return int - the total number of boys born to the family.
     */
    public int getBoys() {
        return boys;
    }
    /**
     * This method gets the number of girls born.
     *
     * @return int - the total number of girls born to the family.
     */
    public int getGirls() {
        return girls;
    }
    /**
     * This method increments the number of boys born by one.
     */
    private void addBoy() {
        boys += 1;
    }
    /**
     * This method increments the number of girls born by one.
     */
    private void addGirl() {
        girls += 1;
    }
}
