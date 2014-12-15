/**
 * An exception thrown when an empty MyStack has an element popped.
 *
 * @author Tyler Smith
 * @version 1.0
 */
public class EmptyMyStackException extends Exception {
    /**
     * Creates a checked exception that terminates the operation.
     */
    public EmptyMyStackException() {
        super("Attempted to pop from an empty Stack");
    }

    /**
     * Creates a checked exception that terminates the operation with
     * a specified message.
     * @param message - the message to be displayed when the exception
     *        is thrown
     */
    public EmptyMyStackException(String message) {
        super(message);
    }
}
