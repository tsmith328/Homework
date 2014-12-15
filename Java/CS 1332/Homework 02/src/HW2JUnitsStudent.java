import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertArrayEquals;

import org.junit.Test;
import org.junit.Before;

/**
 * Student JUnits for HW02
 * @version 1.1
 * @author Albert Shaw
 */
public class HW2JUnitsStudent {

    private LinkedListInterface<Integer> list;
    private StackInterface<Integer> stack;
    private QueueInterface<Integer> queue;

    @Before
    public void setUp() {
        list = new DoublyLinkedList<Integer>();
        stack = new Stack<Integer>();
        queue = new Queue<Integer>();

    }
    @Test (timeout = 200)
    public void getHeadTailNull() {
        assertEquals(list.getHead(), null);
        assertEquals(list.getTail(), null);
    }

    /*
     * LinkedList Tests
     */

    @Test (timeout = 200)
    public void testLinkedListAddToFront1() {
        list.addToFront(new Integer(1));
        Object[] result = list.toArray();
        assertEquals(result[0], new Integer(1));
        assertEquals(1, result.length);
        checkLinkedList(list, new Integer[]{1});
    }

    @Test (timeout = 200)
    public void testLinkedListAddToFront2() {
        list.addToFront(new Integer(0));
        list.addToFront(new Integer(1));
        list.addToFront(new Integer(2));
        list.addToFront(new Integer(3));
        list.addToFront(new Integer(4));
        list.addToFront(new Integer(5));
        Object[] result = list.toArray();
        for (int i = 0; i < result.length; i++) {
            assertEquals(result[i], new Integer(result.length - i - 1));
        }
        checkLinkedList(list, new Integer[]{5, 4, 3, 2, 1, 0});
    }

    @Test (timeout = 200)
    public void testLinkedListAddToBack1() {
        list.addToBack(new Integer(1));
        Object[] result = list.toArray();
        assertEquals(result[0], new Integer(1));
        assertEquals(1, result.length);
        checkLinkedList(list, new Integer[]{1});
    }

    @Test (timeout = 200)
    public void testLinkedListAddToBack2() {
        list.addToBack(new Integer(0));
        list.addToBack(new Integer(1));
        list.addToBack(new Integer(2));
        list.addToBack(new Integer(3));
        list.addToBack(new Integer(4));
        list.addToBack(new Integer(5));
        Object[] result = list.toArray();
        for (int i = 0; i < result.length; i++) {
            assertEquals(result[i], new Integer(i));
        }
        checkLinkedList(list, new Integer[]{0, 1, 2, 3, 4, 5});
    }

    @Test(timeout = 200)
    public void testGet1() {
        list.addToBack(new Integer(0));
        assertEquals(new Integer(0), list.get(0));
    }

    @Test(timeout = 200)
    public void testGet2() {
        list.addToBack(new Integer(0));
        list.addToBack(new Integer(1));
        list.addToBack(new Integer(2));

        assertEquals(new Integer(0), list.get(0));
        assertEquals(new Integer(1), list.get(1));
        assertEquals(new Integer(2), list.get(2));
    }

    @Test(timeout = 200)
    public void testAddAtIndex1() {
        list.addAtIndex(0, new Integer(0));
        list.addAtIndex(1, new Integer(2));
        list.addAtIndex(1, new Integer(1));

        checkLinkedList(list, new Integer[]{0, 1, 2});
    }

    @Test(timeout = 200)
    public void testRemoveAtIndex1() {
        list.addAtIndex(0, new Integer(0));
        list.addAtIndex(1, new Integer(2));
        list.addAtIndex(1, new Integer(1));

        assertEquals(new Integer(1), list.removeAtIndex(1));
        checkLinkedList(list, new Integer[]{0, 2});
        assertEquals(new Integer(2), list.removeAtIndex(1));
        checkLinkedList(list, new Integer[]{0});
        assertEquals(new Integer(0), list.removeAtIndex(0));
        checkLinkedList(list, new Integer[0]);
    }

    @Test (timeout = 200)
    public void testLinkedListRemoveEmpty() {
        assertEquals(list.removeFromFront(), null);
    }

    @Test (timeout = 200)
    public void testLinkedListRemoveFromFront1() {
        list.addToFront(new Integer(1));
        assertEquals(list.removeFromFront(), new Integer(1));
        checkLinkedList(list, new Integer[0]);
    }

    @Test (timeout = 200)
    public void testLinkedListRemoveFromFront2() {
        list.addToFront(new Integer(0));
        list.addToFront(new Integer(1));
        list.addToFront(new Integer(2));
        list.addToFront(new Integer(3));
        list.addToFront(new Integer(4));
        list.addToFront(new Integer(5));
        list.removeFromFront();
        Object[] result = list.toArray();
        for (int i = 0; i < result.length; i++) {
            assertEquals(result[i], new Integer(result.length - i - 1));
        }
        checkLinkedList(list, new Integer[]{4, 3, 2, 1, 0});
    }

    @Test (timeout = 200)
    public void testLinkedListRemoveFromBack1() {
        assertEquals(list.removeFromBack(), null);
    }

    @SuppressWarnings("unused")
    @Test (timeout = 200)
    public void testLinkedListRemoveFromBack2() {
        list.addToFront(new Integer(1));
        assertEquals(list.removeFromBack(), new Integer(1));
        Object[] result = list.toArray();
        checkLinkedList(list, new Integer[0]);
    }

    @Test (timeout = 200)
    public void testLinkedListRemoveFromBack3() {
        list.addToFront(new Integer(0));
        list.addToFront(new Integer(1));
        list.addToFront(new Integer(2));
        list.addToFront(new Integer(3));
        list.addToFront(new Integer(4));
        list.addToFront(new Integer(5));
        list.removeFromBack();
        Object[] result = list.toArray();
        for (int i = 0; i < result.length; i++) {
            assertEquals(result[i], new Integer(result.length - i));
        }
        checkLinkedList(list, new Integer[]{5, 4, 3, 2, 1});
    }

    @Test (timeout = 200)
    public void testIsEmpty1() {
        list.addToBack(new Integer(1));
        assertFalse(list.isEmpty());
    }

    @Test (timeout = 200)
    public void testSizeAddToBack1() {
        list.addToBack(new Integer(1));
        assertEquals(list.size(), 1);
    }

    @Test (timeout = 200)
    public void testSizeAddToFront1() {
        list.addToFront(new Integer(1));
        assertEquals(list.size(), 1);
    }

    @Test (timeout = 200)
    public void testSizeRemoveFromFront1() {
        list.addToFront(new Integer(1));
        list.removeFromFront();
        assertEquals(list.size(), 0);
    }

    @Test (timeout = 200)
    public void testSizeRemoveFromBack1() {
        list.addToFront(new Integer(1));
        list.removeFromBack();
        assertEquals(list.size(), 0);
    }

    @Test (timeout = 200)
    public void testClear1() {
        list.addToBack(new Integer(0));
        list.addToBack(new Integer(1));
        list.addToBack(new Integer(2));
        list.addToBack(new Integer(3));
        list.addToBack(new Integer(4));
        list.addToBack(new Integer(5));
        list.clear();

        checkLinkedList(list, new Integer[0]);
    }

    /*
     * Stack Tests
     */
    @Test (timeout = 200)
    public void testStackPushPop1() {
        stack.push(new Integer(1));
        assertEquals(stack.pop(), new Integer(1));

    }

    @Test (timeout = 200)
    public void testStackPopNull() {
        assertEquals(stack.pop(), null);
    }

    @Test (timeout = 200)
    public void testStackSize1() {
        assertEquals(stack.size(), 0);
    }

    @Test (timeout = 200)
    public void testStackIsEmpty1() {
        assertTrue(stack.isEmpty());
    }

    /*
     * Queue Tests
     */
    @Test (timeout = 200)
    public void testQueueEnqueueDequeue1() {
        queue.enqueue(new Integer(1));
        assertEquals(queue.dequeue(), new Integer(1));
    }

    @Test (timeout = 200)
    public void testQueueDequeueNull() {
        assertEquals(queue.dequeue(), null);
    }

    @Test (timeout = 200)
    public void testQueueSize() {
        assertEquals(queue.size(), 0);
    }

    @Test (timeout = 200)
    public void testQueueIsEmpty1() {
        assertTrue(queue.isEmpty());
    }

    private void checkLinkedList(LinkedListInterface<Integer> list,
                                 Object[] array) {
        Node<Integer> head = list.getHead();
        Node<Integer> tail = list.getTail();
        if (array.length == 0) {
            assertTrue(head == null);
            assertTrue(tail == null);
        } else {
            assertEquals(head.getData(), array[0]);
            Node<Integer> current = head;
            Node<Integer> next = head;
            for (int x = 0; x < array.length; x++) {
                current = next;
                assertEquals(current.getData(), array[x]);
                next = current.getNext();
            }
            assertTrue(current == tail);

            current = tail;
            next = tail;
            for (int x = array.length - 1; x >= 0; x--) {
                current = next;
                assertEquals(current.getData(), array[x]);
                next = current.getPrevious();
            }
            assertTrue(current == head);
            assertEquals(tail.getData(), array[array.length - 1]);
            assertTrue(head.getPrevious() == null);
            assertTrue(tail.getNext() == null);
        }
    }

    //Josh Morton's tests

    /**
     * Some general tests on all three
     * Asserts that all structures can handle emptieness alright
     */
    @Test (timeout = 200)
    public void testEmpties() {
        assertNull(list.getHead());
        assertNull(list.getTail());
        assertNull(stack.pop());
        assertNull(queue.dequeue());
    }

    //additional tests on the linked list

    /**
     * This is a fun one
     * Asserts that the linkedlist can handle null values
     * kind of checks toArray
     */
    @Test (timeout = 200)
    public void testNulls() {
        list.addToFront(null);
        list.addToFront(null);
        list.addToFront(null);
        assertArrayEquals(new Object[]{null, null, null}, list.toArray());
    }

    /**
     * Asserts that removeAtIndex from an empty list raises an exception
     */
    @Test (timeout = 200, expected = java.lang.IndexOutOfBoundsException.class)
    public void testRemoveIndexZeroEmpty() {
        list.removeAtIndex(0);
    }

    /**
     * Asserts that removing beyond size-1 causes issues
     */
    @Test (timeout = 200, expected = java.lang.IndexOutOfBoundsException.class)
    public void testRemoveLargeIndexLarge() {
        list.addToFront(1);
        list.addToFront(0);
        list.removeAtIndex(5);
    }

    /**
     * Asserts that removing at negative indicies throws exceptions
     */
    @Test (timeout = 200, expected = java.lang.IndexOutOfBoundsException.class)
    public void testNegativeIndex() {
        list.addToFront(1);
        list.removeAtIndex(-1);
    }

    /**
     * Asserts that addToFront works
     * Asserts that addToBack works
     * Asserts that addAtIndex works
     * Asserts that toArray works
     * Asserts that removeFromFront works
     * Asserts that removeFromBack works
     * Asserts that removeAtIndex works
     * Asserts that toArray works
     * Asserts that removing down to an empty array sets head and tail to null
     */
    @Test (timeout = 200)
    public void testRemovalNotCircular() {
        list.addToFront(0);
        list.addToBack(5);
        list.addAtIndex(1, 4);
        list.addAtIndex(1, 3);
        list.addAtIndex(1, 2);
        list.addAtIndex(1, 1);
        assertArrayEquals(new Integer[]{0, 1, 2, 3, 4, 5}, list.toArray());
        list.removeFromBack();
        assertArrayEquals(new Integer[]{0, 1, 2, 3, 4}, list.toArray());
        list.removeFromFront();
        assertArrayEquals(new Integer[]{1, 2, 3, 4}, list.toArray());
        list.removeAtIndex(1);
        list.removeAtIndex(2);
        list.removeAtIndex(1);
        list.removeAtIndex(0);
        assertArrayEquals(new Integer[]{}, list.toArray());
        assertNull(list.getHead());
        assertNull(list.getTail());
        assertTrue(list.isEmpty());
        assertEquals(0, list.size());

    }

    /**
     * Asserts that head==tail!=null at length 1 both before and after more
     * has been added and then removed from the list
     */
    @Test (timeout = 200)
    public void testHeadTailEquality() {
        list.addToFront(0);
        assertEquals(list.getHead(), list.getTail());
        assertNotNull(list.getHead());

        list.addToFront(1);
        assertEquals(new Integer(0), list.removeFromBack());
        assertEquals(list.getHead(), list.getTail());
    }

    /**
     * Asserts that removing from back is O(1)
     * this is the only big oh test this time
     */
    @Test (timeout = 50)
    public void testRemoveAtIndexNBigOh() {
        for (int i = 0; i < 100000; i++) {
            list.addToFront(0);
        }
        while (!list.isEmpty()) {
            list.removeFromBack();
        }
    }
}