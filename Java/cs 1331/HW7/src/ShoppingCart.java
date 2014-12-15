import java.text.NumberFormat;
import java.util.Locale;

/**
 * Provides a shopping cart that contains a list of Purchasable
 * items that have been purchased.
 * @author Tyler Smith
 * @version 1.0
 */
public class ShoppingCart {
    private Purchasable[] itemList;
    private int items;

    /**
     * Creates a shopping cart for the customer to use, with a set size.
     * @param int - The maximum number of items the cart can hold.
     */
    public ShoppingCart(int maxSize) {
        itemList = new Purchasable[maxSize];
        items = 0;
    }

    /**
    * Adds an item to the shopping cart, provided there is room.
    * @param Purchasable - The item that is to be added.
    * @return String - A String letting the shopper know whether
    * or not the item was successfully added.
    */
    public String addItem(Purchasable item) {
        if (this.isFull()) {
            return "Your cart is full!";
        }
        itemList[items] = item;
        items++;
        return (item.getName() + " added!");
    }

    /**
     * Empties the contents of the ShoppingCart if it has anything in it.
     */
    public void emptyCart() {
        if (!this.isEmpty()) {
            itemList = new Purchasable[this.getMaxItems()];
            items = 0;
        }
    }

    /**
     * Determines the total price of all the items in the cart
     * before tax.
     * @return double - The summed price of the items before tax.
     */
    public double subtotal() {
        double subtotal = 0;
        for (int i = 0; i < this.items; i++) {
            subtotal += itemList[i].getPrice();
        }
        return subtotal;
    }

    /**
     * Determines the total price of all the items in the cart
     * after tax is added.
     * @return double - The summed price of the items after tax.
     */
    public double total() {
        double total = 0;
        for (int i = 0; i < this.items; i++) {
            total += itemList[i].getAfterTaxPrice();
        }
        return total;
    }

    /**
     * Determines if the cart has the maximum number of items in it.
     * @return boolean - Whether or not the cart is full.
     */
    public boolean isFull() {
        return items == this.getMaxItems();
    }

    /**
     * Determines if the cart has zero items in it.
     * @return boolean - Whether or not the cart is empty.
     */
    public boolean isEmpty() {
        return items == 0;
    }

    /**
     * Determines the maximum number of items that may be put in the cart.
     * @return int - The max number of items that can be added.
     */
    public int getMaxItems() {
        return itemList.length;
    }

    /**
     * Constructs a String containing the list of items in the cart along
     * with the subtotal and total of the items.
     * @return String - The list of items in the cart.
     */
    public String toString() {
        String out = "";
        if (!this.isEmpty()) {
           // for (Purchasable food : itemList) {
            for (int i = 0; i < items; i++) {
                out += itemList[i].toString() + '\n';
            }
            out = out.substring(0, out.length() - 1);
        }
        NumberFormat form = NumberFormat.getCurrencyInstance(Locale.US);
        return ("You have " + this.items + "/" + this.getMaxItems()
            + " items in your cart:\n" + out + "\n\n" + "Subtotal: "
            + form.format(this.subtotal()) + '\n' + "Total: "
            + form.format(this.total()));
    }
}