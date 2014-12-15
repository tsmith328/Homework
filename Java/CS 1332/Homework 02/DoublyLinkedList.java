/**
 * Doubly linked list implementation
 * @author Tyler Smith
 * @version 1.0
 */
public class DoublyLinkedList<T> implements LinkedListInterface<T> {

    private int size = 0;
    private Node<T> head = null, tail = null;

    @Override
    public void addAtIndex(int index, T data) {
        if (index < 0 || index > size) {
            throw new IndexOutOfBoundsException();
        } else if (index == 0) {
            this.addToFront(data);
        } else if (index == this.size()) {
            this.addToBack(data);
        } else {
            Node<T> node = new Node<T>(data);
            Node<T> current = head;
            for (int i = 0; i < index; i++) {
                current = current.getNext();
            }
            node.setNext(current);
            node.setPrevious(current.getPrevious());
            (current.getPrevious()).setNext(node);
            current.setPrevious(node);
            size++;
        }
        head.setPrevious(null);
        tail.setNext(null);
    }

    @Override
    public T get(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException();
        } else if (index == 0) {
            return head.getData();
        } else if (index == size - 1) {
            return tail.getData();
        } else {
            Node<T> node = head;
            for (int i = 0; i < index; i++) {
                node = node.getNext();
            }
            return node.getData();
        }
    }

    @Override
    public T removeAtIndex(int index) {
        T data;
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException();
        } else if (index == 0) {
            data = this.removeFromFront();
        } else if (index == size - 1) {
            data = this.removeFromBack();
        } else {
            Node<T> node = head;
            for (int i = 0; i < index; i++) {
                node = node.getNext();
            }
            data = node.getData();
            Node<T> next = node.getNext();
            Node<T> prev = node.getPrevious();
            next.setPrevious(prev);
            prev.setNext(next);
            size--;
        }
        return data;
    }

    @Override
    public void addToFront(T t) {
        Node<T> node = new Node<T>(t);
        if (this.isEmpty()) {
            head = node;
            tail = node;
        } else {
            head.setPrevious(node);
            node.setNext(head);
            head = node;
        }
        size++;
    }

    @Override
    public void addToBack(T t) {
        Node<T> node = new Node<T>(t);
        if (this.isEmpty()) {
    //        node.setPrevious(null);
    //        node.setNext(null);
            head = node;
            tail = node;
        } else {
            tail.setNext(node);
            node.setPrevious(tail);
            tail = node;
        }
        size++;
    }

    @Override
    public T removeFromFront() {
        if (this.isEmpty()) {
            return null;
        }
        if (this.size() == 1) {
            T data = head.getData();
            this.clear();
            return data;
        }
        T data = head.getData();
        head = head.getNext();
        head.setPrevious(null);
        size--;
        return data;
    }

    @Override
    public T removeFromBack() {
        if (this.isEmpty()) {
            return null;
        }
        if (this.size() == 1) {
            T data = head.getData();
            this.clear();
            return data;
        }
        T data = tail.getData();
        tail = tail.getPrevious();
        tail.setNext(null);
        size--;
        return data;
    }

    @Override
    public Object[] toArray() {
        Object[] arr = new Object[this.size()];
        Node<T> current = head;
        for (int i = 0; i < this.size(); i++) {
            arr[i] = current.getData();
            current = current.getNext();
        }
        return arr;
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
     * You will get a 0 if you do not implement this method.
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
     * You will get a 0 if you do not implement this method.
     *
     * @return Node representing the tail of the linked list
     */
    public Node<T> getTail() {
        return tail;
    }
}
