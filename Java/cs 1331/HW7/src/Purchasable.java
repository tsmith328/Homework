/**
 * Defines characteristics that all Purchasable (food) items should have.
 * All Purchasable items should have a name and price.
 * @author Tyler Smith
 * @version 1.1 - 14 March 2014
 */
public interface Purchasable {
    double SALES_TAX = 0.05;

    String getName();

    double getPrice();

    double getAfterTaxPrice();
}