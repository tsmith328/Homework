import java.util.List;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertArrayEquals;

@SuppressWarnings("unused")
public class BSTStudentTests {
    private BSTInterface<Integer> bst;
    private static final int TEST_SIZE = 1000;

    @Before
    public void setup() {
        bst = new BST<Integer>();
    }

    // lets define some trees

    /**
     * The emptree is a tree with nothing in it, the root reference is null
     *
     *
     *
     * @return an empty BST
     */
    private BST<Integer> emptree() {
        BST<Integer> tree = new BST<Integer>();
        return tree;
    }

    /**
     * The stump is simply a root. The root has no child nodes
     *
     * 5
     *
     * @return a single node BST
     */
    private BST<Integer> stump() {
        BST<Integer> tree = new BST<Integer>();
        tree.add(5);
        return tree;
    }

    /**
     * The telephone pole tree is a rare species, tall and thin
     *
     * 5 / 4 / 3 / 2 / 1 / 0
     *
     * @return
     */
    private BST<Integer> telephonePole() {
        BST<Integer> tree = new BST<Integer>();
        tree.add(5);
        tree.add(4);
        tree.add(3);
        tree.add(2);
        tree.add(1);
        tree.add(0);
        return tree;
    }

    /**
     * The sapling is a small tree, young and immature, like us,.
     *
     * 10 / \ 5 15
     *
     * @return
     */
    private BST<Integer> sapling() {
        BST<Integer> tree = new BST<Integer>();
        tree.add(10);
        tree.add(5);
        tree.add(15);
        return tree;
    }

    /**
     * the balanced tree is a tree of scale see, it even looks like one
     *
     * --20-- / \ 10 30 / \ / \ 5 15 25 35
     *
     * @return
     */
    private BST<Integer> balanced() {
        BST<Integer> tree = new BST<Integer>();
        tree.add(20); // root
        tree.add(10); // left
        tree.add(5);
        tree.add(15);
        tree.add(30); // right
        tree.add(25);
        tree.add(35);
        return tree;
    }

    /**
     * The remover is a specific tree used to test the terrible case where
     * removing is a pain
     *
     * ----20---- / \ 10 30 / \ 5 12 / \ 3 6 \ 7 \ 8
     *
     * specifically, you remove 10. This is fun.
     *
     * @return
     */
    private BST<Integer> remover() {
        BST<Integer> tree = new BST<Integer>();
        tree.add(20); // root
        tree.add(10); // left
        tree.add(5);
        tree.add(3);
        tree.add(6);
        tree.add(7);
        tree.add(8);
        tree.add(12);
        tree.add(30); // right
        return tree;
    }

    /**
     * This is a terrible class it follows horrible design principles and is
     * more or less useless however, it makes sure you're checking equality
     * correctly
     */
    private class DoubleNumber implements Comparable<DoubleNumber> {
        private int value;
        private int publ;

        public DoubleNumber(int publ, int value) {
            this.publ = publ;
            this.value = value;
        }

        public boolean equals(Object other) {
            if (publ == ((DoubleNumber) other).publ) {
                return true;
            }
            return false;
        }

        public int compareTo(DoubleNumber other) {
            if (publ == ((DoubleNumber) other).publ) {
                return 0;
            }
            return publ - ((DoubleNumber) other).publ;
        }
    }

    /**
     * Tests to be sure that the tree functions when the tree points to null add
     * works when null remove works when null get works when null contains works
     * when null size works when null height works when null levelorder works
     * with null postorder preorder inorder work with null
     */
    @SuppressWarnings("deprecation")
    @Test(timeout = 200)
    public void testOnNull() {
        BST<Integer> tree = this.emptree();
        tree.add(1);
        assertArrayEquals(new Integer[] {1}, tree.levelorder().toArray());
        tree = this.emptree();
        assertNull(tree.remove(7));
        assertNull(tree.get(5));
        assertFalse(tree.contains(5));
        assertEquals(0, tree.size());
        assertEquals(-1, tree.height());
        assertEquals(new Integer[] {}, tree.levelorder().toArray());
        assertEquals(new Integer[] {}, tree.postorder().toArray());
        assertEquals(new Integer[] {}, tree.preorder().toArray());
        assertEquals(new Integer[] {}, tree.inorder().toArray());
    }

    /**
     * Well the stump does have a size, 1 but it is doesn't come above the
     * ground you can make it taller and then shorter and that once it is
     * shorter it stays that way
     *
     */
    @Test(timeout = 200)
    public void testSingleNode() {
        BST<Integer> tree = this.stump();
        assertEquals(1, tree.size());
        assertEquals(0, tree.height());
        assertNull(tree.get(3));
        tree.add(3);
        assertEquals((Integer) 3, tree.get(3));
        assertEquals((Integer) 3, tree.remove(3));
        assertNull(tree.remove(3));
    }

    /**
     * Tests some small stuff
     *
     * 10 / \ 5 15
     *
     * becomes
     *
     * 10 / \ 5 15 / \ / \ 3 6 11 16
     *
     * becomes
     *
     * 6 / \ 5 15 / / \ 3 11 16
     *
     */
    @Test(timeout = 200)
    public void testSmallTree() {
        BST<Integer> tree = this.sapling();
        assertArrayEquals(new Integer[] {5, 10, 15}, tree.inorder().toArray());
        tree.add(3);
        tree.add(6);
        tree.add(11);
        tree.add(16);
        assertArrayEquals(new Integer[] {3, 5, 6, 10, 11, 15, 16}, tree
                .inorder().toArray());
        assertEquals((Integer) 10, tree.remove(10));
        assertArrayEquals(new Integer[] {3, 5, 6, 11, 15, 16}, tree.inorder()
                .toArray());
        assertArrayEquals(new Integer[] {6, 5, 15, 3, 11, 16}, tree
                .levelorder().toArray());
    }

    @Test(timeout = 200)
    public void testRemoval() {
        BST<Integer> tree = this.remover();
        tree.remove(10);
        assertArrayEquals(new Integer[] {3, 5, 6, 7, 8, 12, 20, 30}, tree
                .inorder().toArray());
        assertArrayEquals(new Integer[] {20, 8, 30, 5, 12, 3, 6, 7}, tree
                .levelorder().toArray());
    }

    @Test(timeout = 200)
    public void testComparisons() {
        BST<DoubleNumber> tree = new BST<DoubleNumber>();
        tree.add(new DoubleNumber(1, 3));
        tree.add(new DoubleNumber(2, 5));
        tree.add(new DoubleNumber(-1, 7));
        assertEquals(3, tree.get(new DoubleNumber(1, 5)).value);
    }

    @Test(timeout = 200)
    public void testBasicBalanced() {
        bst.add(2);
        bst.add(1);
        bst.add(3);
        assertEquals(3, bst.size());

        Node<Integer> root = bst.getRoot();
        assertEquals(new Integer(2), root.getData());
        assertEquals(new Integer(1), root.getLeft().getData());
        assertEquals(new Integer(3), root.getRight().getData());
    }

    @Test(timeout = 200)
    public void testRemoveTwoChildren() {
        plantTree();
        assertEquals(new Integer(67), bst.getRoot().getData());
        assertEquals(new Integer(67), bst.remove(67));
        assertEquals(new Integer(59), bst.getRoot().getData());

        assertEquals(new Integer(79), bst.remove(79));
        assertEquals(new Integer(73), bst.getRoot().getRight().getData());
    }

    @Test(timeout = 200)
    public void testContains() {
        plantTree();
        assertTrue(bst.contains(43));
        assertTrue(bst.contains(97));
        assertFalse(bst.contains(98));
        assertFalse(bst.contains(18));
        assertFalse(bst.contains(31));
    }

    @Test(timeout = 200)
    public void testRemoveEmptyTree() throws Exception {
        assertNull(bst.remove(5));
    }

    @Test(timeout = 200)
    public void testGet() throws Exception {
        createBalanced7();
        for (int i = 1; i < 8; i++) {
            assertEquals(new Integer(i), bst.get(i));
        }
        assertNull(bst.get(11));
        assertNull(bst.get(-11));
    }

    @Test(timeout = 200)
    public void testSize() throws Exception {
        create12345678();
        assertEquals(8, bst.size());
    }

    @Test(timeout = 200)
    public void testPreorder() throws Exception {
        createBalanced7();
        Integer[] expected = {4, 2, 1, 3, 6, 5, 7};
        List<Integer> arrList = bst.preorder();
        Integer[] arr = arrList.toArray(new Integer[0]);
        assertArrayEquals(expected, arr);
    }

    @Test(timeout = 200)
    public void testPostorder() throws Exception {
        createBalanced7();
        Integer[] expected = {1, 3, 2, 5, 7, 6, 4};
        List<Integer> arrList = bst.postorder();
        Object[] arr = arrList.toArray();
        assertArrayEquals(expected, arr);
    }

    @Test(timeout = 200)
    public void testInorder() throws Exception {
        createBalanced7();
        Integer[] expected = {1, 2, 3, 4, 5, 6, 7};
        List<Integer> arrList = bst.inorder();
        Object[] arr = arrList.toArray();
        assertArrayEquals(expected, arr);
    }

    @Test(timeout = 200)
    public void testLevelorder() throws Exception {
        createBalanced7();
        Integer[] expected = {4, 2, 6, 1, 3, 5, 7};
        List<Integer> arrList = bst.levelorder();
        Object[] arr = arrList.toArray();
        assertArrayEquals(expected, arr);
    }

    @Test(timeout = 200)
    public void testClear() throws Exception {
        createBalanced7();
        bst.clear();
        assertNull(bst.getRoot());
        assertEquals(0, bst.size());
    }

    @Test(timeout = 200)
    public void testHeight() throws Exception {
        createBalanced7();
        assertEquals(2, bst.height());
    }

    public void plantTree() {
        // root
        bst.add(67);

        // left side
        bst.add(47);
        bst.add(37);
        bst.add(53);
        bst.add(41);
        bst.add(43);
        bst.add(59);

        // right side
        bst.add(79);
        bst.add(73);
        bst.add(71);
        bst.add(89);
        bst.add(83);
        bst.add(97);

    }

    // START Emily's Tests
    public void create12345678() {
        bst.add(1);
        bst.add(2);
        bst.add(3);
        bst.add(4);
        bst.add(5);
        bst.add(6);
        bst.add(7);
        bst.add(8);
    }

    public void createBalanced7() {
        bst.add(4);
        bst.add(2);
        bst.add(6);
        bst.add(1);
        bst.add(3);
        bst.add(5);
        bst.add(7);
    }

}
