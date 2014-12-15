/**
 * CircularLinkedList implementation
 * @author Tyler Smith
 * @version 1.0
 */
public class CircularLinkedList<T> implements LinkedListInterface<T> {

    private Node<T> head = null, tail = head;

    private int size = 0;

    @Override
    public void addAtIndex(int index, T data) {
        if (index < 0 || index > this.size()) {
            throw new IndexOutOfBoundsException();
        }
        if (index == 0) {
            this.addToFront(data);
        } else if (index == this.size()) {
            this.addToBack(data);
        } else {
            Node<T> current = head;
            if (index == 1) {
                current.setNext(new Node<T>(data, current.getNext()));
            } else {
                for (int i = 0; i < index - 1; i++) {
                    current = current.getNext();
                }
                Node<T> temp = current;
                current = new Node<T>(data, temp);
            }
            size++;
        }
    }

    @Override
    public T get(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException();
        }
        Node<T> current = head;
        for (int i = 0; i < index; i++) {
            current = current.getNext();
        }
        return current.getData();
    }

    @Override
    public T removeAtIndex(int index) {
        if (index < 0 || index >= this.size()) {
            throw new IndexOutOfBoundsException();
        }
        if (index == 0) {
            T data = head.getData();
            head = head.getNext();
            tail.setNext(head);
            size--;
            return data;
        } else {
            Node<T> before = tail;
            Node<T> current = head;
            for (int i = 0; i < index; i++) {
                before = current;
                current = current.getNext();
            }
            T data = current.getData();
            before.setNext(current.getNext());
            size--;
            return data;
        }
    }

    @Override
    public void addToFront(T t) {
        if (this.isEmpty()) {
            head = new Node<T>(t, tail);
            tail = head;
            tail.setNext(head);
            size++;
            return;
        }
        Node<T> node = new Node<T>(t, head);
        head = node;
        tail.setNext(head);
        size++;
    }

    @Override
    public void addToBack(T t) {
        if (this.isEmpty()) {
            tail = new Node<T>(t);
            head = tail;
            tail.setNext(head);
            head.setNext(tail);
            size++;
        } else {
            Node<T> temp = tail;
            tail = new Node<T>(t, head);
            temp.setNext(tail);
            size++;
        }
    }

    @Override
    public T removeFromFront() {
        if (this.isEmpty()) {
            return null;
        }
        Node<T> ret = head;
        head = head.getNext();
        tail.setNext(head);
        size--;
        return ret.getData();
    }

    @Override
    public T removeFromBack() {
        if (this.isEmpty()) {
            return null;
        }
        Node<T> iterate = head;
        while (iterate.getNext() != tail) {
            iterate = iterate.getNext();
        }
        iterate.setNext(head);
        Node<T> ret = tail;
        tail = iterate;
        size--;
        return ret.getData();
    }

    @SuppressWarnings("unchecked")
    @Override
    public T[] toList() {
        Object[] list = new Object[this.size()];
        int i = 0;
        Node<T> current = head;
        while (i < this.size()) {
            list[i] = current.getData();
            current = current.getNext();
            i++;
        }
        return ((T[]) list);
    }

    @Override
    public boolean isEmpty() {
        return (this.size() == 0);
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public void clear() {
        head = null;
        tail = null;
        size = 0;
    }

    /**
     * Reference to the head node of the linked list.
     * Normally, you would not do this, but we need it
     * for grading your work.
     *
     * @return Node representing the head of the linked list
     */
    public Node<T> getHead() {
        return head;
    }

    /**
     * Reference to the tail node of the linked list.
     * Normally, you would not do this, but we need it
     * for grading your work.
     *
     * @return Node representing the tail of the linked list
     */
    public Node<T> getTail() {
        return tail;
    }

    /**
     * This method is for your testing purposes.
     * You may choose to implement it if you wish.
     */
    @Override
    public String toString() {
        return "";
    }
}

