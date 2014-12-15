import java.util.Set;
import java.util.TreeSet;

public class SkipList<T extends Comparable<? super T>>
    implements SkipListInterface<T> {
    private CoinFlipper coinFlipper;
    private int size;
    private Node<T> head;


    /**
     * constructs a SkipList object that stores data in ascending order
     * when an item is inserted, the flipper is called until it returns a tails
     * if for an item the flipper returns n heads, the corresponding node has
     * n + 1 levels
     *
     * @param coinFlipper the source of randomness
     */
    public SkipList(CoinFlipper coinFlipper) {
        size = 0;
        head = new Node<T>(null, 0);
        this.coinFlipper = coinFlipper;
    }

    @Override
    public T first() {
        Node<T> curr = head;
        while (curr.getLevel() != 0) {
            curr = curr.getDown();
        }
        T outData;
        if (curr.getNext() == null) {
            outData = null;
        } else {
            outData = curr.getNext().getData();
        }
        return outData;
    }

    @Override
    public T last() {
        Node<T> curr = head;
        T data;
        if (head.getNext() == null) {
            data = null;
        } else {
            while (curr.getNext() != null) { //move right in row
                curr = curr.getNext();
            }
            while (curr.getLevel() > 0) { //move down at end of row
                curr = curr.getDown();
                while (curr.getNext() != null) { //move right in row
                    curr = curr.getNext();
                }
            }
            data = curr.getData();
        }
        return data;
    }

    @Override
    public boolean contains(T data) {
        if (data == null) {
            throw new IllegalArgumentException();
        }
        Node<T> prev = findColumn(data);
        return (prev != null);
    }

    @Override
    public void put(T data) {
        if (data == null) {
            throw new IllegalArgumentException();
        }
        int top = this.flipForLevel();
        while (top > head.getLevel()) {
            this.addLevel();
        }
        Node<T> curr = head;
        Node<T> lastAdded = null;
        //check right (top level)
        while (curr.getNext() != null
                && curr.getNext().getData().compareTo(data) < 0) {
            curr = curr.getNext();
        }
        if (top >= curr.getLevel()) {
            Node<T> newNode = new Node<T>(data,
                    curr.getLevel(), curr.getNext(), lastAdded, null);
            lastAdded = newNode;
            curr.setNext(newNode);
        }
        while (curr.getDown() != null) {
            curr = curr.getDown();
            while (curr.getNext() != null
                    && curr.getNext().getData().compareTo(data) < 0) {
                curr = curr.getNext();
            }
            if (top >= curr.getLevel()) {
                Node<T> newNode = new Node<T>(data,
                        curr.getLevel(), curr.getNext(), lastAdded, null);
                if (lastAdded != null) {
                    lastAdded.setDown(newNode);
                }
                lastAdded = newNode;
                curr.setNext(newNode);
            }
        }
        size++;
    }

    /**
     * Adds a new layer to the top of the skip-list.
     */
    private void addLevel() {
        Node<T> newNode = new Node<T>(null,
                head.getLevel() + 1, null, null, head);
        head = newNode;
    }

    /**
     * Uses the class coin flipper to determine at which level the
     * data item should start (how many promotions).
     * @return the top level for the data item (start at 0)
     */
    private int flipForLevel() {
        int level = 0;
        CoinFlipper.Coin outcome = coinFlipper.flipCoin();
        while (outcome == CoinFlipper.Coin.HEADS) {
            level++;
            outcome = coinFlipper.flipCoin();
        }
        return level;
    }

    @Override
    public T remove(T data) {
        if (data == null) {
            throw new IllegalArgumentException();
        }
        T outData;
        //find top of column containing item
        Node<T> prev = findColumn(data);
        if (prev == null) {
            outData = null; //not found
        } else {
            Node<T> curr = prev.getNext();
            outData = curr.getData();
            prev.setNext(curr.getNext());
            while (curr.getDown() != null) {
                curr = curr.getDown();
                prev = prev.getDown();
                while (prev.getNext() != curr) {
                    prev = prev.getNext();
                }
                curr.setUp(null);
                prev.setNext(curr.getNext());
            }
        }
        if (outData != null) {
            size--;
        }
        return outData;
    }

    @Override
    public T get(T data) {
        if (data == null) {
            throw new IllegalArgumentException();
        }
        T outData;
        //find top data item
        Node<T> prev = findColumn(data);
        if (prev == null) {
            outData = null; //data isn't in the list
        } else {
            Node<T> curr = prev.getNext();
            outData = curr.getData();
        }
        return outData;
    }

    /**
     * Finds the column containing the requested data.
     * @param data - the data to find in the skip-list
     * @return the node directly before the target node,
     *      on the same level as the top-most target item.
     *      Returns null if the data is not in the list
     */
    private Node<T> findColumn(T data) {
        Node<T> prev = head;
        Node<T> output = null;
        boolean loop = true;
        while (prev.getNext() != null
                && prev.getNext().getData().compareTo(data) < 0) {
            prev = prev.getNext();
        }
        if (prev.getNext() != null) {
            if (prev.getNext().getData().compareTo(data) == 0) {
                loop = false;
                output = prev;
            }
        }
        while (loop && prev.getDown() != null) {
            prev = prev.getDown();
            while (prev.getNext() != null
                    && prev.getNext().getData().compareTo(data) < 0) {
                prev = prev.getNext();
            }
            if (prev.getNext() != null) {
                if (prev.getNext().getData().compareTo(data) == 0) {
                    loop = false;
                    output = prev;
                }
            }
        }
        return output;
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public void clear() {
        head = new Node<T>(null, 0);
        size = 0;
    }

    @Override
    public Set<T> dataSet() {
        Set<T> set = new TreeSet<T>();
        Node<T> curr = head;
        while (curr.getDown() != null) {
            curr = curr.getDown();
        }
        curr = curr.getNext();
        for (int i = 0; i < size; i++) {
            if (curr != null) {
                set.add(curr.getData());
                curr = curr.getNext();
            }
        }
        return set;
    }
}
