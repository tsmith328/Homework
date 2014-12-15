import java.text.NumberFormat;
import java.util.Locale;

/**
 * Simulates a Deli at a grocery store, allowing customers to buy premade items.
 * @author Tyler Smith
 * @version 1.0
 */
public class DeliFood implements Purchasable {
    private String name;
    private double price;

    /**
     * Prepares a food with a name and price.
     * @param String foodName - The name of the food to be created.
     * @param double foodPrice - The price of the food to be created.
     */
    private DeliFood(String foodName, double foodPrice) {
        name = foodName;
        price = foodPrice;
    }

    /**
     * Gets the name of the DeliFood this is called on.
     * @return String - The name of the food.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Gets the price of the DeliFood this is called on.
     * @return double - The price of the food.
     */
    public double getPrice() {
        return this.price;
    }

    /**
     * Gets the price of the DeliFood after tax is added.
     * @return double - The price of the food with tax.
     */
    public double getAfterTaxPrice() {
        double taxed = price * Purchasable.SALES_TAX;
        return taxed + price;
    }

    /**
     * Constructs a string consisting of the food name and price in
     * currency form.
     * @return String - The name and price of the food formatted: "name: price".
     */
    public String toString() {
        NumberFormat form = NumberFormat.getCurrencyInstance(Locale.US);
        String finalPrice = form.format(this.getPrice());
        return ("Premade " + this.getName() + ": " + finalPrice);
    }

    /**
     * Creates a DeliFood object named Baklava.
     * @return DeliFood - Baklava priced at $2.25.
     */
    public static DeliFood createBaklava() {
        return new DeliFood("Baklava", 2.25);
    }

    /**
     * Creates a DeliFood object named Gnocchi.
     * @return DeliFood - Gnocchi priced at $1.60.
     */
    public static DeliFood createGnocchi() {
        return new DeliFood("Gnocchi", 1.60);
    }

    /**
     * Creates a DeliFood object named Boudin.
     * @return DeliFood - Boudin priced at $3.99.
     */
    public static DeliFood createBoudin() {
        return new DeliFood("Boudin", 3.99);
    }
}