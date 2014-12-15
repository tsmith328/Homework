/**
 * StacksQueue
 *
 * Implementation of a queue using
 * two stacks as the backing store.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class StacksQueue<T> implements QueueInterface<T> {

    private ArrayStack<T> enqueue, dequeue, temp;
    private int size;
    
    public StacksQueue() {
        enqueue = new ArrayStack<T>();
        dequeue = new ArrayStack<T>();
        temp = new ArrayStack<T>();
        size = 0;
    }
    
    @Override
    public void enqueue(T t) {
        enqueue.push(t);
        this.createDequeue();
        size++;
    }

    
    @Override
    public T dequeue() {
        if (this.isEmpty()) {return null;}

        T out = dequeue.pop();
        this.createEnqueue();
        size--;
        return out;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }
    
    /**
     * Creates the dequeue stack by flipping the enqueue stack.
     */
    private void createDequeue() {
        temp = enqueue;
        dequeue = new ArrayStack<T>();
        for (int i = 0; i < size; i++) {
            dequeue.push(temp.pop());
        }
    }
    
    /**
     * Creates the enqueue stack by flipping the dequeue stack.
     */
    private void createEnqueue() {
        temp = dequeue;
        enqueue = new ArrayStack<T>();
        for (int i = 0; i < size; i++) {
            enqueue.push(temp.pop());
        }
    }
}
