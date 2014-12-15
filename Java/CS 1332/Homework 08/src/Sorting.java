import java.util.LinkedList;
import java.util.Random;

/**
  * Sorting implementation
  * CS 1332 : Fall 2014
  * @author Tyler Smith
  * @version 1.0
  */
public class Sorting implements SortingInterface {

    // Do not add any instance variables.

    @Override
    public <T extends Comparable<? super T>> void bubblesort(T[] arr) {
        int endUnsorted = arr.length - 1;
        boolean hadSwap;
        do {
            hadSwap = false;
            for (int i = 0; i < endUnsorted; i++) {
                if (arr[i].compareTo(arr[i + 1]) > 0) {
                    this.swap(arr, i, i + 1);
                    hadSwap = true;
                }
            }
            endUnsorted--;
        } while (hadSwap && endUnsorted > 0);
    }

    @Override
    public <T extends Comparable<? super T>> void insertionsort(T[] arr) {
        for (int i = 1; i < arr.length; i++) {
            int j = i;
            while (j >= 1 && arr[j].compareTo(arr[j - 1]) < 0) {
                this.swap(arr, j - 1, j);
                j--;
            }
        }
    }

    @Override
    public <T extends Comparable<? super T>> void selectionsort(T[] arr) {
        for (int i = 0; i < arr.length; i++) {
            int smallest = i;
            for (int j = i; j < arr.length; j++) {
                if (arr[smallest].compareTo(arr[j]) > 0) {
                    smallest = j;
                }
            }
            this.swap(arr, smallest, i);
        }
    }

    @Override
    public <T extends Comparable<? super T>> void quicksort(T[] arr, Random r) {
        if (arr.length > 1) {
            quicksort(arr, 0, arr.length - 1, r);
        }
    }

    /**
     * Recursively uses quicksort to sort an array
     * @param arr - the array to sort
     * @param start - the beginning of the region to sort
     * @param stop - the end of the region to sort
     * @param r - a Random object to choose the pivot
     */
    private <T extends Comparable<? super T>> void quicksort(
            T[] arr, int start, int stop, Random r) {
        if (stop - start > 1) {
            int pivot = r.nextInt(stop - start) + start;
            int left = start + 1;
            int right = stop;
            this.swap(arr, pivot, start);
            pivot = start;
            while (left <= right) {
                while (arr[left].compareTo(arr[pivot]) < 0) {
                    left++;
                }
                while (arr[right].compareTo(arr[pivot]) > 0) {
                    right--;
                }
                if (left <= right) {
                    this.swap(arr, left, right);
                    left++;
                    right--;
                }
            }
            this.swap(arr, pivot, right);
            quicksort(arr, start, right, r);
            quicksort(arr, left, stop, r);
        }
    }

    @Override
    public <T extends Comparable<? super T>> void mergesort(T[] arr) {
        T[] merged = mergesort(arr, arr.length);
        for (int i = 0; i < arr.length; i++) {
            arr[i] = merged[i];
        }
    }

    /**
     * Recursively uses merge sort to sort an array
     * @param arr - the array to sort
     * @param size - the size of arr
     * @return the sorted array
     */
    @SuppressWarnings("unchecked")
    private <T extends Comparable<? super T>> T[] mergesort(T[] arr, int size) {
        if (size > 1) {
            int mid = size / 2;
            T[] left = (T[]) new Comparable[mid];
            T[] right = (T[]) new Comparable[size - mid];
            for (int i = 0; i < mid; i++) {
                left[i] = arr[i];
            }
            for (int j = mid; j < size; j++) {
                right[j - mid] = arr[j];
            }
            left = mergesort(left, left.length);
            right = mergesort(right, right.length);
            return merge(left, right);
        }
        return arr;
    }

    /**
     * Merges the two arrays into one.
     * @param left - the array on the left
     * @param right - the array on the right
     * @return a merged array with elements in ascending order
     */
    @SuppressWarnings("unchecked")
    private <T extends Comparable<? super T>> T[] merge(T[] left, T[] right) {
        int leftLen = left.length;
        int rightLen = right.length;
        T[] arr = (T[]) new Comparable[leftLen + rightLen];
        int i = 0;
        int j = 0;
        int k = 0;
        while (i < leftLen && j < rightLen) {
            if (left[i].compareTo(right[j]) <= 0) {
                arr[k] = left[i];
                i++;
            } else {
                arr[k] = right[j];
                j++;
            }
            k++;
        }
        //Catch stragglers
        while (i < leftLen) {
            arr[k] = left[i];
            k++;
            i++;
        }
        while (j < rightLen) {
            arr[k] = right[j];
            j++;
            k++;
        }
        return arr;
    }

    @Override
    @SuppressWarnings("unchecked")
    public int[] radixsort(int[] arr) {
        //Create buckets
        LinkedList<Integer>[] posBuckets = new LinkedList[10];
        LinkedList<Integer>[] negBuckets = new LinkedList[10];
        for (int i = 0; i < 10; i++) {
            posBuckets[i] = new LinkedList<Integer>();
        }
        for (int i = 0; i < 10; i++) {
            negBuckets[i] = new LinkedList<Integer>();
        }

        boolean allZero = false;
        int place = 1;
        while (!allZero) {
            allZero = true;
            for (int i = 0; i < arr.length; i++) {
                if (arr[i] < 0) {
                    //negative item
                    int num = -1 * arr[i];
                    int ind = (num / place) % 10;
                    negBuckets[ind].add(arr[i]);
                } else {
                    //non-negative item
                    int ind = (arr[i] / place) % 10;
                    posBuckets[ind].add(arr[i]);
                    if (ind != 0) {
                        allZero = false;
                    }
                }
            }
            int arrInd = 0;
            for (int i = 8; i > -1; i--) {
                while (!negBuckets[i].isEmpty()) {
                    arr[arrInd] = negBuckets[i].remove();
                    arrInd++;
                }
            }
            for (int i = 0; i < 10; i++) {
                while (!posBuckets[i].isEmpty()) {
                    arr[arrInd] = posBuckets[i].remove();
                    arrInd++;
                }
            }
            place *= 10;
        }
        return arr;
    }

    /**
     * Swaps the elements in arr at left and right.
     * @param arr - the array containing the elements
     * @param left - the first element to swap
     * @param right - the second element to swap
     */
    private <T extends Comparable<? super T>> void swap(
            T[] arr, int left, int right) {
        T temp = arr[left];
        arr[left] = arr[right];
        arr[right] = temp;
    }
}
