/**
 * Interface for a Stack ADT
 * Recitation 2
 *
 * Do not alter this file.
 *
 * @version 1.0
 * @author Arvind Narayan
*/

public interface StackInterface<T> {

    /**
     * Add an element to the stack.
     * If the stack is full,
     * throw a RuntimeException.
     *
     * If t is null, throw an IllegalArgumentException
     *
     * @param t The data to add.
     */
    public void push(T t);
    
    /**
     * Should remove from the stack.
     * Return the removed data if successful.
     * If the stack is empty, return null.
     *
     * @return Removed data, or null if empty stack.
     */
    public T pop();

    /**
     * Return the backing array for the stack.
     * DO NOT RETURN A NEW ARRAY. <-- IMPORTANT
     * Just return your array.
     *
     * @return The backing array.
     */
    public T[] toArray();

    /**
     * Returns a boolean indicating whether or not the stack is empty.
     *
     * @return true if the stack is empty, false if it is not empty.
     */
    public boolean isEmpty();

}
