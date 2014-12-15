import java.util.Iterator;

/**
 * This is a class that will allow you to iterate through the first n
 * Fibonacci elements
 * @author kushagramansingh
 *
 */
public class FibonacciIterator implements Iterator<Integer> {
	private Integer n;
	private Integer current;
	private Integer runningValue = 1;
	private Integer previousValue = 0;
	
	public FibonacciIterator(Integer n) {
	    this.n = n;
	    current = runningValue;
	}
	
	@Override
	public boolean hasNext() {
		if (this.n == 0) {
		    return false;
		}
		return true;
	}

	@Override
	public Integer next() {
		if (this.hasNext()) {
		    previousValue = runningValue;
		    runningValue = current;
		    current = previousValue + runningValue;
		    return current;
		} else {
		    throw new java.util.NoSuchElementException(
		            "You are at the end of your list!");
		}
	}
}
