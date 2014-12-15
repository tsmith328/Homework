import java.util.Scanner;

/**
 * Simulates a grocery store in which customers can buy premade Deli
 * items or buy food from the shelves.
 */
public class GroceryStore {
    private static Scanner scan = new Scanner(System.in);
    public static void main(String[] args) {
        char choice;
        ShoppingCart cart = new ShoppingCart(15);
        System.out.println("Welcome to Tyler's FoodMart!\n");
        do {
            System.out.println(cart.toString());
            System.out.println("\nPress [1] to go to the Deli, press [2] to "
                    + "buy something yourself,\npress [e] to toss your cart"
                    + " into the Abyss, or press [q] to leave the store.");
            choice = scan.nextLine().charAt(0);
            switch (choice) {
                case '1':
                    goToDeli(cart);
                    break;
                case '2':
                    goToAisle(cart);
                    break;
                case 'e':
                    cart.emptyCart();
                    break;
                case 'q':
                    System.out.println("Thank you for shopping with us!");
                    break;
                default:
                    System.out.println("That's not a valid choice! try again!");
            }
        } while(!(choice == 'q'));
        cart.emptyCart();
    }

    /**
     * Simulates the Deli section of the Grocery Store, allowing customers
     * to buy premade foods.
     * @param ShoppingCart - The ShoppingCart item that the customer is using.
     */
    private static void goToDeli(ShoppingCart cart) {
        System.out.println("Which item would you like to buy?\n1. Gnocchi\n"
                + "2. Boudin\n3. Baklava\n4. Leave Deli.");
        char num = scan.nextLine().charAt(0);
        boolean retry = false;
        do {
            switch (num) {
                case '1':
                    System.out.println(cart.addItem(DeliFood.createGnocchi()));
                    break;
                case '2':
                    System.out.println(cart.addItem(DeliFood.createBoudin()));
                    break;
                case '3':
                    System.out.println(cart.addItem(DeliFood.createBaklava()));
                    break;
                case '4':
                    System.out.println("Sorry you couldn't find anything.");
                    return;
                default:
                    System.out.println("That isn't a food!");
                    retry = true;
            }
        } while(retry);
    }

    /**
     * Simulates the aisles of the Grocery Store, allowing customers
     * to buy a multitude foods.
     * @param ShoppingCart - The ShoppingCart item that the customer is using.
     */
    private static void goToAisle(ShoppingCart cart) {
        System.out.println("What item do you want?");
        String name = scan.nextLine();
        System.out.println("How much is your item before tax?");
        String price = scan.nextLine();
        double priceDoub;
        try { //Allows for input with or without a dollar sign.
            priceDoub = Double.parseDouble(price);
        } catch (NumberFormatException e) {
            priceDoub = Double.parseDouble(price.substring(1));
        }
        GroceryItem food = new GroceryItem(name, priceDoub);
        System.out.println(cart.addItem(food));
    }
}