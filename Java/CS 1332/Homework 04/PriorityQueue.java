public class PriorityQueue<T extends Comparable<? super T>> implements
       PriorityQueueInterface<T>, Gradable<T> {

    private Heap<T> mainHeap;

    public PriorityQueue() {
        mainHeap = new Heap<T>();
    }

    @Override
    public void insert(T item) {
        mainHeap.add(item);
    }

    @Override
    public T findMin() {
        return mainHeap.peek();
    }

    @Override
    public T deleteMin() {
        return mainHeap.remove();
    }

    @Override
    public boolean isEmpty() {
        return mainHeap.isEmpty();
    }

    @Override
    public void makeEmpty() {
        mainHeap = new Heap<T>();
    }

    @Override
    public T[] toArray() {
        return mainHeap.toArray();
    }
}
