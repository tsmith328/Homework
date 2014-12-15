/**
 * Sorts arrays of Comparables using the Mergesort algorithm.
 * @author Tyler
 *
 */
public class MergeSorter extends AbstractSorter {

    /**
     * Constructs a wrapper around the array, allowing the user to sort it.
     *
     * @param arr - an array of Comparables
     */
    public MergeSorter(Comparable[] arr) {
        super(arr);
    }

    /**
     * Sorts the array using the Mergesort algorithm.
     */
    public void sortArray() {
        int len = array.length;
        if (len <= 1) {
            return;
        }
        Comparable[] left, right;
        int mid = Math.round(len / 2);
        left = new Comparable[mid];
        right = new Comparable[len - mid];
        for (int i = 0; i < mid; i++) {
            left[i] = array[i];
        }
        for (int j = mid; j < len; j++) {
            right[j - mid] = array[j];
        }

        AbstractSorter leftSorter = new MergeSorter(left);
        AbstractSorter rightSorter = new MergeSorter(right);
        leftSorter.sortArray();
        rightSorter.sortArray();
        array = merge(leftSorter.getArray(), rightSorter.getArray());
    }

    /**
     * Removes the first element in the provided array
     *
     * @param old - the array to be shortened
     * @return Comparable[] - a copy of the old array, less the first element.
     */
    private static Comparable[] removeFirst(Comparable[] old) {
        Comparable[] newArr = new Comparable[old.length - 1];
        for (int i = 1; i < old.length; i++) {
            newArr[i - 1] = old[i];
        }
        return newArr;
    }

    /**
     * Merges two arrays, sorting the elements together.
     *
     * @param left - The first array to be merged.
     * @param right - The second array to be merged.
     * @return Comparable[] - a sorted array consisting of both input arrays
     */
    private static Comparable[] merge(Comparable[] left, Comparable[] right) {
        Comparable[] finished = new Comparable[left.length + right.length];
        int pos = 0;
        while (left.length > 0 || right.length > 0) {
            if (left.length > 0 && right.length > 0) {
                if (left[0].compareTo(right[0]) <= 0) {
                    finished[pos] = left[0];
                    pos++;
                    left = removeFirst(left);
                } else {
                    finished[pos] = right[0];
                    pos++;
                    right = removeFirst(right);
                }
            } else if (left.length > 0) {
                finished[pos] = left[0];
                pos++;
                left = removeFirst(left);
            } else if (right.length > 0) {
                finished[pos] = right[0];
                pos++;
                right = removeFirst(right);
            }
        }
        return finished;
    }
}
