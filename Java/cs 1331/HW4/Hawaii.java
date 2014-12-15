/**
 * This class contains the methods that check, welcome,
 * and change names to Hawaiian.
 * @author Tyler Smith
 * @version 1.0
 */

public class Hawaii {

    /**
     * Determines if the given name is Hawaiian.
     * @param name - The name to check if it is Hawaiian.
     * @return true if all of the letters are in the Hawaiian alphabet.
     * false otherwise.
     */

    public static boolean isHawaiian(String name) {
        boolean isHawaiian = true;
        //Go through each letter and see if it's Hawaiian.
        //If even one is not, the whole method evaluates false.
        for (int i = 0; (i < name.length()); i++) {
            String letter = name.substring(i, i + 1);
            switch (letter) {
                case "a":
                    break;
                case "e":
                    break;
                case "i":
                    break;
                case "o":
                    break;
                case "u":
                    break;
                case "k":
                    break;
                case "l":
                    break;
                case "h":
                    break;
                case "m":
                    break;
                case "n":
                    break;
                default:
                    isHawaiian = false;
            }
        }
        return isHawaiian;
    }

    /**
     * This method determines which greeting to use. 50% "Aloha",
     * 30% "Welcome to Hawaii", and 20% "E komo mai."
     * @param none
     * @return A String greeting determined by chance.
     */

    public static String getGreeting() {
        double rand = Math.random();
        String greeting;
        if (rand <= 0.50) { //50% of returns
            greeting = "Aloha, ";
        } else if (rand > 0.50 && rand <= 0.80) { //30% of returns
            greeting = "Welcome to Hawaii, ";
        } else { //Remaining 20% of returns
            greeting = "E komo mai, ";
        }
        return greeting;
    }

    /**
     * Removes all non-Hawaiian letters from a name.
     * @param name - The name to make Hawaiian.
     * @return String - The modified name.
     */

    public static String makeName(String name) {
        String outName = "";
        for (int i = 0; i < name.length(); i++) {
            String makeLetter = name.substring(i, i + 1);
            switch (makeLetter) {
                case "a":
                case "e":
                case "i":
                case "o":
                case "u":
                case "k":
                case "l":
                case "h":
                case "m":
                case "n":
                    //Construct a Hawaiian name
                    outName = outName + makeLetter;
                    break;
                default:
                    break;
            }
        }
        //Capitalize the first letter in the name.
        char firstLetter = outName.charAt(0);
        char newFirst = (char) (firstLetter + (-32));
        String first = String.valueOf(newFirst);
        String newName = first + outName.substring(1, outName.length());
        return newName;
    }
}
