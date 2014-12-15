/**
 * ArrayStack
 *
 * Implementation of a stack using an array
 * as the backing store.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class ArrayStack<T> implements StackInterface<T> {

    private static final int STACK_SIZE = 200;
    private int size;
    private Object[] array;
    //HINT Use an object array and something to keep track
    //     of what the next available slot or last added index is.

    public ArrayStack() {
        array = new Object[STACK_SIZE];
        size = 0;
    }

    @Override
    public void push(T t) {
        if (this.isFull()) {
            throw new RuntimeException();
        } else if (t == null) {
            throw new IllegalArgumentException();
        } else {
        array[size] = t;
        size++;
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public T pop() {
        if (this.isEmpty()) {
            return null;
        }
        T out = (T) array[size];
        size--;
        return out;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public T[] toArray() {
        return (T[]) array;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }
    
    /**
     * Checks if the stack is full.
     * 
     * @return true if the stack is full; false elsewhere
     */
    private boolean isFull() {
        return size == array.length;
    }
}
