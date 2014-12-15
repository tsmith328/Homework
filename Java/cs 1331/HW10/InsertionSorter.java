/**
 * Sorts arrays of Comparables using the Insertionsort algorithm.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class InsertionSorter extends AbstractSorter {
    /**
     * Constructs a wrapper around the array, allowing the user to sort it.
     *
     * @param arr - an array of Comparables to sort.
     */
    public InsertionSorter(Comparable[] arr) {
        super(arr);
    }

    /**
     * Sorts the array using the Insertionsort algorithm.
     */
    public void sortArray() {
        int j;
        for (int i = 0; i < array.length; i++) {
            j = i;
            while ((j > 0) && (array[j].compareTo(array[j - 1]) < 0)) {
                this.swap(j, j - 1);
                j--;
            }
        }
    }
}
