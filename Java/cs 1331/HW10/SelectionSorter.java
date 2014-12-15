/**
 * Sorts arrays of Comparable types using the Selectionsort algorithm.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class SelectionSorter extends AbstractSorter {

    /**
     * Constructs a wrapper around the provided array, allowing it to be sorted.
     *
     * @param arr - an array of Comparables
     */
    public SelectionSorter(Comparable[] arr) {
        super(arr);
    }

    /**
     * Sorts the array using the Selectionsort algorithm.
     */
    public void sortArray() {
        int min;
        for (int j = 0; j < array.length; j++) {
            min = getMinIndex(j, array.length);
            if (min != j) {
                this.swap(min, j);
            }
        }
    }

    /**
     * Gets the index of the minimum element in the sub-array.
     * @param start - the starting index of the sub-array in the main array.
     * @param end - the ending index of the sub-array in the main array.
     * @return int - the index of the minimum element in the interval
     *         [start, end);
     */
    private int getMinIndex(int start, int end) {
        int min = start;
        for (int i = start; i < end; i++) {
            if (array[i].compareTo(array[min]) < 0) {
                min = i;
            }
        }
        return min;
    }
}