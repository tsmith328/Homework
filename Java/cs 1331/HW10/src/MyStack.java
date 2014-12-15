/**
 * Creates a Stack of type T which can only be accessed from the top.
 *
 * @author Tyler Smith
 * @version 1.0
 * @param <T> - the class of the contents of the Stack.
 */
public class MyStack<T> {
    private Node top;
    private Node bottom;

    /**
     * Constructs the stack, making it empty.
     */
    public MyStack() {
       top = null;
       bottom = null;
    }

    /**
     * Pushes the element to the top of the Stack.
     *
     * @param elmt - the new element to be pushed
     */
    public void push(T elmt) {
        Node n = new Node(elmt, top);
        top = n;
    }

    /**
     * Pops an element from the top of the Stack
     *
     * @return T - the element from the top of the Stack
     */
    public T pop() throws EmptyMyStackException {
        if (this.isEmpty()) {
            throw new EmptyMyStackException();
        }
        T element = top.me;
        Node next = top.next;
        top = next;
        return element;
    }

    /**
     * Determines if the Stack is empty
     *
     * @return true if the Stack is empty, false otherwise
     */
    public boolean isEmpty() {
        if (top == bottom) {
            return true;
        }
        return false;
    }

    /**
     * A private utility class to help structure the Stack
     *
     * @author Tyler Smith
     * @version 1.0
     */
    private class Node {
        private T me;
        private Node next;

        /**
         * Creates the node to hold the elements
         *
         * @param elem - the element to be held in this node
         * @param next - the node currently on top of the stack
         */
        public Node(T elem, Node next) {
            me = elem;
            this.next = next;
        }
    }
}
