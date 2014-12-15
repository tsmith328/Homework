/**
 * Interface for a Queue ADT
 * Recitation 2
 *
 * Do not alter this file.
 *
 * @version 1.0
 * @author Arvind Narayan
 */
 
public interface QueueInterface<T> {

    /**
     * Add an element to the queue.
     *
     * @param t The data to add.
     */
    public void enqueue(T t);
    
    /**
     * Should remove from the queue.
     * Return the removed data if successful.
     * If the queue is empty, return null.
     *
     * @return Removed data, or null if empty stack.
     */
    public T dequeue();

    
    /**
     * Returns a boolean indicating whether or not the queue is empty.
     *
     * @return true if the queue is empty, false if it is not empty.
     */
    public boolean isEmpty();


}
