import java.text.NumberFormat;
import java.util.Locale;

/**
 * Allows the customer to buy different items in the GroceryStore.
 * @author Tyler Smith
 * @version 1.0
 */
public class GroceryItem implements Purchasable {
    private static final double FOOD_TAX = 0.01;
    private String name;
    private double price;

    /**
     * Creates a GroceryItem that has the given name and price.
     * @param String itemName - The name of the food.
     * @param String itemPrice - The price of the item.
     */
    public GroceryItem(String itemName, double itemPrice) {
        name = itemName;
        price = itemPrice;
    }

    /**
     * Gets the name of the GroceryItem this is called on.
     * @return String - The name of the food.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Gets the price of the GroceryItem this is called on.
     * @return double - The price of the food.
     */
    public double getPrice() {
        return this.price;
    }

    /**
     * Gets the price of the item after tax is added.
     * @return double - The price of the food with tax added.
     */
    public double getAfterTaxPrice() {
        double tax = price * FOOD_TAX;
        return price + tax;
    }

    /**
     * Constructs a string with the name and price of the food
     * in currency format.
     * @return String - The name and price of the food in format: "name: price".
     */
    public String toString() {
        NumberFormat form = NumberFormat.getCurrencyInstance(Locale.US);
        String finalPrice = form.format(this.getPrice());
        return (this.getName() + ": " + finalPrice);
    }
}