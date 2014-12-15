/**
 * Sorts arrays of Comparable types using the Bubblesort algorithm.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class BubbleSorter extends AbstractSorter {

    /**
     * Constructs a wrapper around the array, allowing the user to sort it.
     *
     * @param arr - an array of Comparables
     */
    public BubbleSorter(Comparable[] arr) {
        super(arr);
    }

    /**
     * Sorts the array of Comparables using Bubblesort.
     */
    public void sortArray() {
        boolean outOfPlace = true;
        while (outOfPlace) {
            outOfPlace = false;
            for (int i = 0; i < array.length - 1; i++) {
                if (array[i].compareTo(array[i + 1]) > 0) {
                    this.swap(i, i + 1);
                    outOfPlace = true;
                }
            }
        }
    }
}
