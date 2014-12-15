import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

import org.junit.Before;
import org.junit.Test;

/**
 * CircularLinkedListTests Student Edition
 *
 * @version 1.1 Changelog: 1.1 Fix testAddFrontSingle() to actually add to the
 *          front. 1.0 Initial release
 */
public class CircularLinkedListTestStudent {

    private LinkedListInterface<Integer> list;

    @Before
    public void setup() {
        list = new CircularLinkedList<Integer>();
    }

    @Test(timeout = 200)
    public void testAddFrontSingle() {
        list.addToFront(new Integer(1));
        assertEquals(1, list.size());
        assertSame(((CircularLinkedList<Integer>) list).getHead(),
                ((CircularLinkedList<Integer>) list).getTail());
        assertSame(((CircularLinkedList<Integer>) list).getHead().getNext(),
                ((CircularLinkedList<Integer>) list).getHead());
        assertEquals(new Integer(1), ((CircularLinkedList<Integer>) list)
                .getHead().getData());
    }

    @Test(timeout = 200)
    public void testAddBackSingle() {
        list.addToBack(new Integer(1));
        assertEquals(1, list.size());
        assertSame(((CircularLinkedList<Integer>) list).getHead(),
                ((CircularLinkedList<Integer>) list).getTail());
        assertSame(((CircularLinkedList<Integer>) list).getHead().getNext(),
                ((CircularLinkedList<Integer>) list).getHead());
        assertEquals(new Integer(1), ((CircularLinkedList<Integer>) list)
                .getHead().getData());
    }

    @Test(timeout = 200)
    public void testRemoveFront() {
        list.addToBack(new Integer(1));
        list.addToBack(new Integer(2));
        list.addToBack(new Integer(3));
        assertEquals(3, list.size());
        assertEquals(new Integer(1), ((CircularLinkedList<Integer>) list)
                .getHead().getData());
        list.removeFromFront();
        assertEquals(2, list.size());
        assertSame(((CircularLinkedList<Integer>) list).getTail().getNext(),
                ((CircularLinkedList<Integer>) list).getHead());
        assertEquals(new Integer(2), ((CircularLinkedList<Integer>) list)
                .getHead().getData());
    }

    @Test(timeout = 200)
    public void testRemoveBackNoData() {
        assertNull(list.removeFromBack());
    }

    @Test(timeout = 200)
    public void testToListMany() {
        Integer[] nums = addManyElementsToBack();
        assertArrayEquals(nums, list.toList());
    }

    @Test(timeout = 200)
    public void testIsEmpty() {
        assertTrue(list.isEmpty());
        list.addToFront(new Integer(0));
        assertFalse(list.isEmpty());
        list.addToBack(new Integer(1));
        assertFalse(list.isEmpty());
        list.removeFromFront();
        assertFalse(list.isEmpty());
        list.removeFromBack();
        assertTrue(list.isEmpty());
    }

    @Test(timeout = 200)
    public void testClearWithSize() {
        assertEquals(0, list.size());
        list.addToFront(new Integer(5));
        list.addToFront(new Integer(14));
        list.addToFront(new Integer(2));
        assertEquals(3, list.size());
        list.clear();
        assertEquals(0, list.size());
    }

    @Test(timeout = 200)
    public void testAddAtIndex() {
        list.addAtIndex(0, new Integer(0));
        list.addAtIndex(1, new Integer(2));
        list.addAtIndex(1, new Integer(1));

        Node<Integer> currentNode = ((CircularLinkedList<Integer>) list)
                .getHead();
        assertEquals(new Integer(0), currentNode.getData());
        currentNode = currentNode.getNext();
        assertEquals(new Integer(1), currentNode.getData());
        currentNode = currentNode.getNext();
        assertEquals(new Integer(2), currentNode.getData());
        assertSame(currentNode.getNext(), ((CircularLinkedList<Integer>) list)
                .getHead());
        assertSame(currentNode, ((CircularLinkedList<Integer>) list).getTail());
    }

    @Test(timeout = 200, expected = IndexOutOfBoundsException.class)
    public void testAddAtNegativeIndex() {
        list.addAtIndex(-1, new Integer(1));
    }

    @Test(timeout = 200)
    public void testRemoveAtIndex() {
        list.addAtIndex(0, new Integer(0));
        list.addAtIndex(1, new Integer(2));
        list.addAtIndex(1, new Integer(1));

        assertEquals(new Integer(1), list.removeAtIndex(1));
        assertEquals(new Integer(2), list.removeAtIndex(1));
        assertEquals(new Integer(0), list.removeAtIndex(0));
        assertTrue(list.isEmpty());
    }

    @Test(timeout = 200)
    public void testGet() {
        list.addToBack(new Integer(0));
        list.addToBack(new Integer(1));
        list.addToBack(new Integer(2));

        assertEquals(new Integer(0), list.get(0));
        assertEquals(new Integer(1), list.get(1));
        assertEquals(new Integer(2), list.get(2));
    }

    @Test(timeout = 200)
    public void testRemoveAtIndexFromFront() {
        list.addAtIndex(0, new Integer(0));
        list.addAtIndex(1, new Integer(2));
        list.addAtIndex(1, new Integer(1));

        assertEquals(new Integer(0), list.removeAtIndex(0));
        assertEquals(new Integer(1), list.removeAtIndex(0));
        assertEquals(new Integer(2), list.removeAtIndex(0));
        assertEquals(0, list.size());
    }

    @Test(timeout = 200, expected = IndexOutOfBoundsException.class)
    public void testRemoveAtLargeIndex() {
        list.removeAtIndex(100);
    }

    private Integer[] addManyElementsToBack() {
        Integer[] nums = new Integer[1000];
        for (int i = 0; i < 1000; i++) {
            list.addToBack(new Integer(i));
            nums[i] = new Integer(i);
        }
        return nums;
    }

    /**
     * Additional unit tests that should cover most (all?) edge cases and
     * situations There is some overlap between these and the tests we were
     * provided, but basically anything relevant that this doesn't check, the TA
     * provided tests cover (I think, don't trust me, check!)
     *
     * @author Joshua Morton
     *
     *         Tests for the following methods AddAtIndex - tested on index -1
     *         in other file, 0, 1 and larger than list here get - tested on 0,
     *         n, size-1, as well as tested for errors on -1 and larger than
     *         list removeAtIndex - tested on first, last, and middle values,
     *         negative values courtesy of provided code addToFront - tested on
     *         single and multiple values addToBack - tested on single and
     *         multiple values removeFromFront - tested on empty, 1, others
     *         removeFromBack - tested on empty, 1, others toList - checked on a
     *         large list and empty one isEmpty - tested based on all methods
     *         that can remove items from the list in other words,
     *         remove{FromBack, FromFront, AtIndex} all correctly remove items
     *         and set head/tail to null size - tested when the list is empty,
     *         items are added, and then removed clear - tested on empty and
     *         full lists
     *
     *         Big Oh time tests addToFront - O(1) addToBack - O(1) addAtIndex -
     *         depends, O(1) or O(n), both situations tested removeFromFront -
     *         O(1) removeFromBack - O(n) removeFromIndex - O(1) or O(n), both
     *         situations tested size - O(1) clear - O(1) isEmpty - O(1) toList
     *         - O(n) get - O(1) or O(n), both situations tested
     */
    public class AdditionalTests {
        private LinkedListInterface<Integer> list;

        @Before
        public void setup() {
            list = new CircularLinkedList<Integer>();
        }

        @Test(timeout = 200)
        public void testAddFrontSingle() {
            /**
             * Asserts that addToFront works for single values Asserts that tail
             * == head on a list of one item Asserts that neither head nor tail
             * is null
             */
            list.addToFront(1);
            assertEquals(1, list.size());
            assertSame(((CircularLinkedList<Integer>) list).getHead(),
                    ((CircularLinkedList<Integer>) list).getTail());
            assertSame(
                    ((CircularLinkedList<Integer>) list).getHead().getNext(),
                    ((CircularLinkedList<Integer>) list).getHead());
            assertEquals(new Integer(1), ((CircularLinkedList<Integer>) list)
                    .getHead().getData());
            assertNotNull(((CircularLinkedList<Integer>) list).getHead());
        }

        @Test(timeout = 200)
        public void testAddFront() {
            /**
             * Asserts that multiple items can be added to the front Asserts
             * that they appear in reverse order from how they were added
             * Asserts that tail.next == head in a list of multiple items we
             * know from before that they aren't null
             */
            list.addToFront(3);
            list.addToFront(2);
            list.addToFront(1);
            assertEquals(3, list.size());
            assertEquals(new Integer(3), list.get(2));
            assertEquals(new Integer(2), list.get(1));
            assertEquals(new Integer(1), list.get(0));
            assertSame(
                    ((CircularLinkedList<Integer>) list).getTail().getNext(),
                    ((CircularLinkedList<Integer>) list).getHead());
        }

        @Test(timeout = 200)
        public void testAddBackSingle() {
            /**
             * Asserts that addToBack works for single values Asserts that tail
             * == head on a list of one item under addToBack as well Asserts
             * that neither head nor tail is null
             */
            list.addToBack(1);
            assertEquals(1, list.size());
            assertSame(((CircularLinkedList<Integer>) list).getHead(),
                    ((CircularLinkedList<Integer>) list).getTail());
            assertSame(
                    ((CircularLinkedList<Integer>) list).getHead().getNext(),
                    ((CircularLinkedList<Integer>) list).getHead());
            assertEquals(new Integer(1), ((CircularLinkedList<Integer>) list)
                    .getHead().getData());
            assertNotNull(((CircularLinkedList<Integer>) list).getHead());
        }

        @Test(timeout = 200)
        public void testAddBack() {
            /**
             * Asserts that multiple items can be added to the back Asserts that
             * they appear in the same order that they were added Asserts that
             * tail.next == head in a list of multiple items we know from before
             * that they aren't null
             */
            list.addToBack(1);
            list.addToBack(2);
            list.addToBack(3);
            assertEquals(3, list.size());
            assertEquals(new Integer(1), list.get(0));
            assertEquals(new Integer(2), list.get(1));
            assertEquals(new Integer(3), list.get(2));
            assertSame(
                    ((CircularLinkedList<Integer>) list).getTail().getNext(),
                    ((CircularLinkedList<Integer>) list).getHead());
        }

        @Test(timeout = 200, expected =
                java.lang.IndexOutOfBoundsException.class)
        public void testAddAtIndexBeyondBounds() {
            /**
             * Asserts that adding at position greater than length causes
             * trouble
             */
            list.addAtIndex(1, 1);
        }

        @Test(timeout = 200)
        public void testAddAtIndexSingle() {
            /**
             * Asserts that adding at a position is possible Asserts that once
             * again, head == tail and neither is null
             */
            list.addAtIndex(0, 1);
            assertSame(((CircularLinkedList<Integer>) list).getTail(),
                    ((CircularLinkedList<Integer>) list).getHead());
            assertNotNull(((CircularLinkedList<Integer>) list).getTail());
        }

        @Test(timeout = 200)
        public void testAddAtIndex() {
            /**
             * Asserts that adding at multiple positions is possible Asserts
             * tail.next == head Asserts that order is preserved correctly
             * Additionally, at this point we can assume that get(i) works as
             * expected
             */
            list.addAtIndex(0, 0);
            list.addAtIndex(1, 2);
            list.addAtIndex(1, 1);
            assertSame(
                    ((CircularLinkedList<Integer>) list).getTail().getNext(),
                    ((CircularLinkedList<Integer>) list).getHead());
            assertEquals(new Integer(0), list.get(0));
            assertEquals(new Integer(1), list.get(1));
            assertEquals(new Integer(2), list.get(2));
        }

        @Test(timeout = 200, expected =
                java.lang.IndexOutOfBoundsException.class)
        /**
         * Asserts that removing from an empty list causes an error
         */
        public void testRemoveAtIndex0Error() {
            list.removeAtIndex(0);
        }

        @Test(timeout = 200, expected =
                java.lang.IndexOutOfBoundsException.class)
        public void testRemoveAtLargeIndexError() {
            /**
             * Asserts that removing beyond the index bounds of an existing list
             * causes an error
             */
            list.addToFront(1);
            list.addToFront(1);
            list.addToFront(1);
            list.removeAtIndex(10);
        }

        @Test(timeout = 200)
        public void testIsEmpty() {
            /**
             * Asserts that a list begins empty Asserts that once an item is
             * added and removed the list remains empty Asserts the above for
             * every method of adding and removal (removeFromFront,
             * removeFromBack, removeAtIndex)
             */
            assertTrue(list.isEmpty());
            list.addToFront(1);
            list.removeFromBack();
            assertTrue(list.isEmpty());
            list.addToFront(1);
            list.removeFromFront();
            assertTrue(list.isEmpty());
            list.addToFront(1);
            list.removeAtIndex(0);
            assertTrue(list.isEmpty());
        }

        @Test(timeout = 200)
        public void testSize() {
            /**
             * Asserts that an empty list has size 0 Asserts that a list with
             * items in it has a size len(list) Asserts that once items are
             * removed, the size reflects that
             */
            assertEquals(list.size(), 0);
            list.addToFront(1);
            list.addAtIndex(1, 2);
            list.addToBack(3);
            assertEquals(3, list.size());
            list.removeAtIndex(1);
            assertEquals(list.size(), 2);
        }

        @Test(timeout = 200)
        public void testRemoveAtIndexLast() {
            /**
             * Asserts that removeAtIndex(size-1) removes the final item
             */
            list.addToBack(0);
            list.addToBack(1);
            list.addToBack(2);
            list.addToBack(3);
            list.addToBack(4);
            list.removeAtIndex(4);
            assertSame(
                    ((CircularLinkedList<Integer>) list).getTail().getNext(),
                    ((CircularLinkedList<Integer>) list).getHead());
        }

        @Test(timeout = 200)
        public void testRemoveAtIndexFirst() {
            /**
             * Asserts that removeAtIndex(0) removes the first item
             */
            list.addToBack(0);
            list.addToBack(1);
            list.removeAtIndex(0);
            assertSame(
                    ((CircularLinkedList<Integer>) list).getTail().getNext(),
                    ((CircularLinkedList<Integer>) list).getHead());
            assertEquals(((CircularLinkedList<Integer>) list).getHead()
                    .getData(), new Integer(1));
        }

        @Test(timeout = 200)
        public void testRemoveAtIndexN() {
            /**
             * Asserts that removeAtIndex(n) removes the nth item
             */
            list.addToBack(0);
            list.addToBack(1);
            list.addToBack(2);
            list.addToBack(3);
            list.addToBack(4);
            list.removeAtIndex(3);
            assertSame(list.get(3), ((CircularLinkedList<Integer>) list)
                    .getTail().getData());
            assertEquals(((CircularLinkedList<Integer>) list).getTail()
                    .getData(), new Integer(4));
        }

        @Test(timeout = 200)
        public void testGet() {
            /**
             * Asserts that get returns the nth node Asserts that get returns
             * the first node Asserts that get returns the last node
             */
            list.addToBack(0);
            list.addToBack(1);
            list.addToBack(2);
            assertSame(
                    ((CircularLinkedList<Integer>) list).getTail().getData(),
                    list.get(2));
            assertSame(
                    ((CircularLinkedList<Integer>) list).getHead().getData(),
                    list.get(0));
            assertSame(((CircularLinkedList<Integer>) list).getHead().getNext()
                    .getData(), list.get(1));
        }

        @Test(timeout = 200, expected =
                java.lang.IndexOutOfBoundsException.class)
        public void testGetToBigSmall() {
            /**
             * Asserts that indices that are too large throw errors on an empty
             * list
             */
            list.get(1);
        }

        @Test(timeout = 200, expected =
                java.lang.IndexOutOfBoundsException.class)
        public void testGetToBigBig() {
            /**
             * Asserts that indices that are too large throw errors on an list
             * with values
             */
            list.addToBack(1);
            list.addToBack(1);
            list.addToBack(1);
            list.addToBack(1);
            list.get(100);
        }

        @Test(timeout = 200, expected =
                java.lang.IndexOutOfBoundsException.class)
        /**
         * Asserts that negative get indices throw errors
         */
        public void testGetNegative() {
            list.get(-1);
        }

        @Test(timeout = 200)
        public void testRemoveFromFront() {
            /**
             * Asserts that null is returned when the list is empty Asserts that
             * the node data is returned for all other situations
             */
            assertNull(list.removeFromFront());
            list.addToBack(1);
            list.addToBack(3);
            assertEquals(list.removeFromFront(), new Integer(1));
        }

        @Test(timeout = 200)
        public void testRemoveFromBack() {
            /**
             * Asserts that null is returned when the list is empty Asserts that
             * the node data is returned for all other situations
             */
            assertNull(list.removeFromBack());
            list.addToBack(1);
            list.addToBack(3);
            assertEquals(list.removeFromBack(), new Integer(3));
        }

        @Test(timeout = 200)
        public void testClear() {
            /**
             * Asserts that clear empties the list Asserts that tail is null
             * Asserts that head is null Asserts that nothing unusual happens if
             * clear() is run on an already empty list
             */
            list.clear();
            list.addToBack(0);
            list.addToBack(0);
            list.addToBack(0);
            list.addToBack(0);
            list.addToBack(0);
            list.clear();
            assertEquals(0, list.size());
            assertNull(((CircularLinkedList<Integer>) list).getHead());
            assertNull(((CircularLinkedList<Integer>) list).getTail());
        }

        @Test(timeout = 200)
        public void testToList() {
            /**
             * Asserts that toList creates the correct list Asserts that the
             * linkedList can handle a lot of items
             */
            assertArrayEquals(list.toList(), new Integer[] {});
            Integer[] comparator = new Integer[1000];
            for (int i = 0; i < 1000; i++) {
                list.addToBack(i);
                comparator[i] = new Integer(i);
            }
            assertArrayEquals(comparator, list.toList());
        }

        @Test(timeout = 25)
        public void testAddToFrontBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that addToFront is O(1) This took 7ms on my powerful
             * desktop, but should be O(1), so this shouldn't change much
             */
            for (int i = 0; i < 100000; i++) {
                list.addToFront(i);
            }
        }

        @Test(timeout = 25)
        public void testAddToBackBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that addToBack is O(1) This took 7ms on my powerful
             * desktop, but should be O(1), so this shouldn't change much
             */
            for (int i = 0; i < 100000; i++) {
                list.addToBack(i);
            }
        }

        @Test(timeout = 50)
        public void testAddToIndexBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that addAtIndex is O(1) for size and 0 This took 15ms on
             * my powerful desktop, but should be O(1), so this shouldn't change
             * much
             */
            for (int i = 0; i < 100000; i++) {
                list.addAtIndex(0, i);
            }
            assertEquals(100000, list.size());
            list.clear();
            for (int i = 0; i < 100000; i++) {
                list.addAtIndex(i, i);
            }
            assertEquals(100000, list.size());
        }

        @Test(timeout = 200)
        public void testAddAtRandomIndexBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that addAtIndex is O(n) for all values not 0 or size This
             * took about 60ms on my powerful desktop, and is O(n), that said,
             * the time I provided should work
             */
            list.addToBack(0);
            for (int i = 0; i < 10000; i++) {
                list.addAtIndex(i, i);
            }
            assertEquals(10001, list.size());
        }

        @Test(timeout = 30)
        public void testRemoveFromFrontBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that removeFromBack is O(1) This took about 10ms on my
             * powerful desktop
             */
            for (int i = 0; i < 100000; i++) {
                list.addAtIndex(0, i);
            }
            while (list.size() != 0) {
                list.removeFromFront();
            }

        }

        @Test(timeout = 250)
        public void testRemoveFromBackBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that removeFromFront is O(n) this took about 95ms on my
             * powerful desktop (but I didn't double the time, figure out why)
             */
            for (int i = 0; i < 10000; i++) {
                list.addAtIndex(0, i);
            }
            while (list.size() != 0) {
                list.removeFromBack();
            }
        }

        @Test(timeout = 15)
        public void testIsEmptyBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that isEmpty is O(1) this took about 3ms on my powerful
             * desktop
             */
            for (int i = 0; i < 100000; i++) {
                list.isEmpty();
            }
            assertTrue(list.isEmpty());
        }

        @Test(timeout = 25)
        public void testClearBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that clear is O(1) this took about 8ms on my powerful
             * desktop
             */
            for (int i = 0; i < 100000; i++) {
                list.addToBack(0);
                list.clear();
            }
            assertTrue(list.isEmpty());
        }

        @Test(timeout = 25)
        public void testSizeBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that size is O(1) this took about 6ms on my powerful
             * desktop
             */
            for (int i = 0; i < 100000; i++) {
                list.addToFront(0);
                list.size();
            }
            assertEquals(100000, list.size());
        }

        @Test(timeout = 750)
        public void testToListBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that toList is O(n) this took about 225ms on my powerful
             * desktop
             */
            for (int i = 0; i < 10000; i++) {
                list.addToFront(0);
                list.toList();
            }

            assertEquals(10000, list.size());
        }

        @Test(timeout = 25)
        public void testGetBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that get is O(1) for size and 0 This took 8ms on my
             * powerful desktop, but should be O(1), so this shouldn't change
             * much
             */
            list.addAtIndex(0, 1);
            for (int i = 0; i < 100000; i++) {
                list.get(0);
            }
            list.addToBack(1);
            list.addToBack(1);
            for (int i = 0; i < 100000; i++) {
                list.get(2);
            }
            assertEquals(3, list.size());
        }

        @Test(timeout = 200)
        public void testGetAtRandomIndexBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that get is O(n) for all values not 0 or size This took
             * about 75ms on my powerful desktop, and is O(n), that said, the
             * time I provided should work
             */
            list.addToFront(0);
            for (int i = 0; i < 10000; i++) {
                list.addToFront(0);
                list.get(i);
            }
            assertEquals(10001, list.size());
        }

        @Test(timeout = 25)
        public void testRemoveAtIndexBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that get is O(1) for 0 This took 9ms on my powerful
             * desktop, but should be O(1), so this shouldn't change much
             */
            for (int i = 0; i < 100000; i++) {
                list.addAtIndex(0, i);
            }
            while (list.size() != 0) {
                list.removeAtIndex(0);
            }
            assertEquals(0, list.size());
        }

        @Test(timeout = 250)
        public void testRemoveAtRandomIndexBigOh() {
            /**
             * This test case will provide false negatives, its possible that
             * you're methods aren't O(n) or O(1) as necessary and this won't
             * catch it, but this will tell you for sure if something is wrong
             * Asserts that removeAtIndex is O(n) for all values not 0 This took
             * about 90ms on my powerful desktop, and is O(n), that said, the
             * time I provided should work
             */
            for (int i = 0; i < 10000; i++) {
                list.addAtIndex(0, i);
            }
            while (list.size() != 0) {
                list.removeAtIndex(list.size() - 1);
            }
            assertEquals(0, list.size());
        }
    }
}
