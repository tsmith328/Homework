public class Heap<T extends Comparable<? super T>> implements HeapInterface<T>,
       Gradable<T> {

    private T[] mainArray;
    private int size;

    @SuppressWarnings("unchecked")
    public Heap() {
        mainArray = (T[]) new Comparable[10];
        size = 0;
    }

    @Override
    public void add(T item) {
        if (item == null) {
            throw new IllegalArgumentException();
        }
        if (size == mainArray.length - 1) {
            grow();
        }
        size++;
        mainArray[size] = item;
        heapifyUp(size);
    }

    /**
     * Grows the backing array.
     */
    @SuppressWarnings("unchecked")
    private void grow() {
        T[] tempArray = (T[]) new Comparable[mainArray.length * 2];
        for (int i = 0; i < mainArray.length; i++) {
            tempArray[i] = mainArray[i];
        }
        mainArray = tempArray;
    }

    /**
     * Bubbles the item at the specified index up through the heap
     * to its correct spot.
     * @param itemIndex - the index of the item to move
     */
    private void heapifyUp(int itemIndex) {
        int parentIndex = (int) (itemIndex / 2);
        T item = mainArray[itemIndex];
        T parent = mainArray[parentIndex];
        while (parent != null && item.compareTo(parent) < 0) {
            T temp = parent;
            mainArray[parentIndex] = item;
            mainArray[itemIndex] = temp;
            itemIndex = parentIndex;
            parentIndex = (itemIndex == 1) ? 0 : (int) (itemIndex / 2);
            parent = mainArray[parentIndex];
        }
    }

    @Override
    public boolean isEmpty() {
        return (size == 0);
    }

    @Override
    public T peek() {
        return mainArray[1];
    }

    @Override
    public T remove() {
        T dataOut = this.peek();
        mainArray[1] = mainArray[size];
        mainArray[size] = null;
        size--;
        heapifyDown(1);
        return dataOut;
    }

    /**
     * Maintains the Heap Property of the heap by moving items down in the
     * heap as needed.
     * @param itemIndex - the index of the item to move.
     */
    private void heapifyDown(int itemIndex) {
        T item = mainArray[itemIndex];
        T leftChild, rightChild, minChild;
        try {
            leftChild = mainArray[itemIndex * 2];
        } catch (IndexOutOfBoundsException e) {
            leftChild = null;
        }
        try {
            rightChild = mainArray[(itemIndex * 2) + 1];
        } catch (IndexOutOfBoundsException e) {
            rightChild = null;
        }
        int minInd;
        if (leftChild == null) {
            return; //no children.
        }
        if (rightChild == null) {
            minChild = leftChild;
            minInd = itemIndex * 2;
        } else {
            if (leftChild.compareTo(rightChild) <= 0) {
                minChild = leftChild;
                minInd = itemIndex * 2;
            } else {
                minChild = rightChild;
                minInd = itemIndex * 2 + 1;
            }
        }
        if (item.compareTo(minChild) > 0) {
            T temp = mainArray[itemIndex];
            mainArray[itemIndex] = mainArray[minInd];
            mainArray[minInd] = temp;
            heapifyDown(minInd);
        }
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public T[] toArray() {
        return mainArray;
    }
}
