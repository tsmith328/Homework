import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertArrayEquals;

import java.util.Map;

import org.junit.Before;
import org.junit.Test;

public class StudentAVLTests {
    private AVL<MagicNumber> avlMagicNumber;
    private AVL<MagicString> avlMagicString;

    @Before
    public void setup() {
        avlMagicNumber = new AVL<MagicNumber>();
        avlMagicString = new AVL<MagicString>();
        cs1332 = new AVL<Student<String, Integer>>();
    }

    @Test(timeout = 250)
    public void testAddNoRotation() {
        addShortBalancedTree();

        Node<MagicNumber> root = avlMagicNumber.getRoot();
        assertEquals(new MagicNumber("hello", 81), root.getData());
        assertEquals(new MagicNumber("goodbye", 13), root.getLeft().getData());
        assertEquals(new MagicNumber("igloo", -4), root.getRight().getData());
        assertNull(root.getLeft().getLeft());
        assertNull(root.getLeft().getRight());
        assertNull(root.getRight().getLeft());
        assertNull(root.getRight().getRight());
    }

    @Test(timeout = 250)
    public void testAddSingleRotation() {
        avlMagicNumber.add(new MagicNumber("goodbye", 13));
        avlMagicNumber.add(new MagicNumber("hello", 81));
        avlMagicNumber.add(new MagicNumber("igloo", -4));

        Node<MagicNumber> root = avlMagicNumber.getRoot();
        assertEquals("Incorrect rotation", new MagicNumber("hello", 81), root
                .getData());
        assertEquals("Incorrect rotation", new MagicNumber("goodbye", 13), root
                .getLeft().getData());
        assertEquals("Incorrect rotation", new MagicNumber("igloo", -4), root
                .getRight().getData());
        assertNull(root.getLeft().getLeft());
        assertNull(root.getLeft().getRight());
        assertNull(root.getRight().getLeft());
        assertNull(root.getRight().getRight());
    }

    @Test(timeout = 250)
    public void testAddDoubleRotation() {
        avlMagicNumber.add(new MagicNumber("igloo", -4));
        avlMagicNumber.add(new MagicNumber("goodbye", 13));
        avlMagicNumber.add(new MagicNumber("hello", 81));
        Node<MagicNumber> root = avlMagicNumber.getRoot();
        assertEquals("Incorrect rotation", new MagicNumber("hello", 81), root
                .getData());
        assertEquals("Incorrect rotation", new MagicNumber("goodbye", 13), root
                .getLeft().getData());
        assertEquals("Incorrect rotation", new MagicNumber("igloo", -4), root
                .getRight().getData());
        assertNull(root.getLeft().getLeft());
        assertNull(root.getLeft().getRight());
        assertNull(root.getRight().getLeft());
        assertNull(root.getRight().getRight());
    }

    @Test(timeout = 250)
    public void testGetContains() {
        addShortBalancedTree();

        assertTrue(avlMagicNumber.contains(new MagicNumber("hello")));

        MagicNumber firstGet = avlMagicNumber.get(new MagicNumber("hello"));
        assertEquals("Data in the tree is not being returned", 81,
                firstGet.magicNumber);

        assertTrue(avlMagicNumber.contains(new MagicNumber("igloo")));

        MagicNumber secondGet = avlMagicNumber.get(new MagicNumber("igloo"));
        assertEquals("Data in the tree is not being returned", -4,
                secondGet.magicNumber);
    }

    @Test(timeout = 250)
    public void testSizeIsEmptyRemoveNoRotation() {
        assertTrue(avlMagicNumber.isEmpty());
        assertEquals(0, avlMagicNumber.size());

        addShortBalancedTree();

        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(3, avlMagicNumber.size());

        assertNull(avlMagicNumber.remove(new MagicNumber("maybe")));
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals("Size is always being decremented", 3, avlMagicNumber
                .size());

        MagicNumber removeResult1 = avlMagicNumber.remove(new MagicNumber(
                "hello"));
        assertEquals("hello", removeResult1.string);
        assertEquals(81, removeResult1.magicNumber);
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(2, avlMagicNumber.size());

        MagicNumber removeResult2 = avlMagicNumber.remove(new MagicNumber(
                "igloo"));
        assertEquals("igloo", removeResult2.string);
        assertEquals(-4, removeResult2.magicNumber);
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(1, avlMagicNumber.size());

        MagicNumber removeResult3 = avlMagicNumber.remove(new MagicNumber(
                "goodbye"));
        assertEquals("goodbye", removeResult3.string);
        assertEquals(13, removeResult3.magicNumber);
        assertTrue(avlMagicNumber.isEmpty());
        assertEquals(0, avlMagicNumber.size());

        assertNull(avlMagicNumber.remove(new MagicNumber("maybe not")));
        assertTrue(avlMagicNumber.isEmpty());
        assertEquals("Size is always being decremented", 0, avlMagicNumber
                .size());
    }

    @Test(timeout = 250)
    public void testSizeIsEmptyRemoveRotations() {
        addLongBalancedTree();

        MagicString removeResult1 = avlMagicString.remove(new MagicString(526));
        assertEquals("Data in the tree is not being returned", "sixth",
                removeResult1.magicString);
        assertEquals("Data in the tree is not being returned",
                new Integer(526), removeResult1.number);
        assertFalse(avlMagicString.isEmpty());
        assertEquals(9, avlMagicString.size());

        Node<MagicString> root = avlMagicString.getRoot();

        assertEquals(new MagicString("first", 477), root.getData());
        assertEquals(new MagicString("second", 251), root.getLeft().getData());
        assertEquals(new MagicString("third", 646), root.getRight().getData());
        assertEquals(new MagicString("fourth", 856), root.getRight().getRight()
                .getData());
        assertEquals(new MagicString("fifth", 186), root.getLeft().getLeft()
                .getData());
        assertNull(root.getRight().getLeft());
        assertEquals(new MagicString("seventh", 287), root.getLeft().getRight()
                .getData());

        MagicString removeResult2 = avlMagicString.remove(new MagicString(856));
        assertEquals("fourth", removeResult2.magicString);
        assertEquals(new Integer(856), removeResult2.number);
        assertFalse(avlMagicString.isEmpty());
        assertEquals(8, avlMagicString.size());

        root = avlMagicString.getRoot();

        assertEquals(new MagicString("second", 251), root.getData());
        assertEquals(new MagicString("fifth", 186), root.getLeft().getData());
        assertEquals(new MagicString("first", 477), root.getRight().getData());
        assertEquals(new MagicString("third", 646), root.getRight().getRight()
                .getData());
        assertEquals(new MagicString("ninth", 124), root.getLeft().getLeft()
                .getData());
        assertEquals(new MagicString("eigth", 224), root.getLeft().getRight()
                .getData());
    }

    @Test(timeout = 250)
    public void testHeight1() {
        addShortBalancedTree();

        assertEquals(1, avlMagicNumber.height());

        assertEquals(1, avlMagicNumber.getRoot().getHeight());
        assertEquals(0, avlMagicNumber.getRoot().getBalanceFactor());
        assertEquals(0, avlMagicNumber.getRoot().getLeft().getHeight());
        assertEquals(0, avlMagicNumber.getRoot().getLeft().getBalanceFactor());
        assertEquals(0, avlMagicNumber.getRoot().getRight().getHeight());
        assertEquals(0, avlMagicNumber.getRoot().getRight().getBalanceFactor());
    }

    @Test(timeout = 250)
    public void testHeight2() {
        addLongBalancedTree();

        Node<MagicString> root = avlMagicString.getRoot();

        assertEquals(3, root.getHeight());
        assertEquals(1, root.getBalanceFactor());
        assertEquals(2, root.getLeft().getHeight());
        assertEquals(0, root.getLeft().getBalanceFactor());
        assertEquals(1, root.getRight().getHeight());
        assertEquals(0, root.getRight().getBalanceFactor());
        assertEquals(1, root.getLeft().getLeft().getHeight());
        assertEquals(0, root.getLeft().getLeft().getBalanceFactor());
        assertEquals(1, root.getLeft().getRight().getHeight());
        assertEquals(-1, root.getLeft().getRight().getBalanceFactor());
    }

    @Test(timeout = 250)
    public void testClear() {
        addShortBalancedTree();
        assertEquals(3, avlMagicNumber.size());
        avlMagicNumber.clear();
        assertEquals("Size isn't being reset to 0", 0, avlMagicNumber.size());
    }

    @Test(timeout = 250)
    public void testPreorder() {
        addLongBalancedTree();
        MagicString[] preorder = new MagicString[10];
        preorder[0] = new MagicString(477);
        preorder[1] = new MagicString(251);
        preorder[2] = new MagicString(186);
        preorder[3] = new MagicString(124);
        preorder[4] = new MagicString(224);
        preorder[5] = new MagicString(287);
        preorder[6] = new MagicString(386);
        preorder[7] = new MagicString(646);
        preorder[8] = new MagicString(526);
        preorder[9] = new MagicString(856);
        assertArrayEquals(preorder, avlMagicString.preorder().toArray(
                new MagicString[0]));
    }

    @Test(timeout = 250)
    public void testPostorder() {
        addLongBalancedTree();
        MagicString[] postorder = new MagicString[10];
        postorder[0] = new MagicString(124);
        postorder[1] = new MagicString(224);
        postorder[2] = new MagicString(186);
        postorder[3] = new MagicString(386);
        postorder[4] = new MagicString(287);
        postorder[5] = new MagicString(251);
        postorder[6] = new MagicString(526);
        postorder[7] = new MagicString(856);
        postorder[8] = new MagicString(646);
        postorder[9] = new MagicString(477);
        assertArrayEquals(postorder, avlMagicString.postorder().toArray(
                new MagicString[0]));
    }

    @Test(timeout = 250)
    public void testInorder() {
        addLongBalancedTree();
        MagicString[] inorder = new MagicString[10];
        inorder[0] = new MagicString(124);
        inorder[1] = new MagicString(186);
        inorder[2] = new MagicString(224);
        inorder[3] = new MagicString(251);
        inorder[4] = new MagicString(287);
        inorder[5] = new MagicString(386);
        inorder[6] = new MagicString(477);
        inorder[7] = new MagicString(526);
        inorder[8] = new MagicString(646);
        inorder[9] = new MagicString(856);
        assertArrayEquals(inorder, avlMagicString.inorder().toArray(
                new MagicString[0]));
    }

    @Test(timeout = 250)
    public void testLevelorder() {
        addLongBalancedTree();
        MagicString[] levelorder = new MagicString[10];
        levelorder[0] = new MagicString(477);
        levelorder[1] = new MagicString(251);
        levelorder[2] = new MagicString(646);
        levelorder[3] = new MagicString(186);
        levelorder[4] = new MagicString(287);
        levelorder[5] = new MagicString(526);
        levelorder[6] = new MagicString(856);
        levelorder[7] = new MagicString(124);
        levelorder[8] = new MagicString(224);
        levelorder[9] = new MagicString(386);
        assertArrayEquals(levelorder, avlMagicString.levelorder().toArray(
                new MagicString[0]));
    }

    private void addShortBalancedTree() {
        avlMagicNumber.add(new MagicNumber("hello", 81));
        avlMagicNumber.add(new MagicNumber("goodbye", 13));
        avlMagicNumber.add(new MagicNumber("igloo", -4));
    }

    private void addLongBalancedTree() {
        avlMagicString.add(new MagicString("first", 477));
        avlMagicString.add(new MagicString("second", 251));
        avlMagicString.add(new MagicString("third", 646));
        avlMagicString.add(new MagicString("fourth", 856));
        avlMagicString.add(new MagicString("fifth", 186));
        avlMagicString.add(new MagicString("sixth", 526));
        avlMagicString.add(new MagicString("seventh", 287));
        avlMagicString.add(new MagicString("eigth", 224));
        avlMagicString.add(new MagicString("ninth", 124));
        avlMagicString.add(new MagicString("tenth", 386));
    }

    private class MagicNumber implements Comparable<MagicNumber> {
        private final String string;
        private final int magicNumber;

        public MagicNumber(String string) {
            this(string, 0);
        }

        public MagicNumber(String string, int magicNumber) {
            this.string = string;
            this.magicNumber = magicNumber;
        }

        @Override
        public boolean equals(Object other) {
            if (other == null) {
                return false;
            }
            if (!(other instanceof MagicNumber)) {
                return false;
            }
            MagicNumber that = (MagicNumber) other;
            return that.string.equals(string);
        }

        @Override
        public int compareTo(MagicNumber other) {
            return string.compareTo(other.string);
        }

        @Override
        public String toString() {
            return "MagicNumber: " + string + ", " + magicNumber;
        }
    }

    private class MagicString implements Comparable<MagicString> {
        private final String magicString;
        private final Integer number;

        public MagicString(Integer number) {
            this("", number);
        }

        public MagicString(String magicString, Integer number) {
            this.magicString = magicString;
            this.number = number;
        }

        @Override
        public boolean equals(Object other) {
            if (other == null) {
                return false;
            }
            if (!(other instanceof MagicString)) {
                return false;
            }
            MagicString that = (MagicString) other;
            return that.number.equals(number);
        }

        @Override
        public int compareTo(MagicString other) {
            return number.compareTo(other.number);
        }

        @Override
        public String toString() {
            return "MagicString: " + magicString + ", " + number;
        }
    }

    @Test(timeout = 250)
    public void testEverything() {
        assertTrue(avlMagicNumber.isEmpty());
        assertEquals(0, avlMagicNumber.size());

        avlMagicNumber.add(new MagicNumber("c", 3));
        avlMagicNumber.add(new MagicNumber("f", 10));
        avlMagicNumber.add(new MagicNumber("k", 20));
        avlMagicNumber.add(new MagicNumber("g", 15));
        avlMagicNumber.add(new MagicNumber("i", 16));
        Node<MagicNumber> root = avlMagicNumber.getRoot();

        assertEquals(5, avlMagicNumber.size());
        assertTrue(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertFalse(avlMagicNumber.isEmpty());

        assertEquals(new MagicNumber("f", 10), root.getData());
        assertEquals(2, root.getHeight());
        assertEquals(-1, root.getBalanceFactor());

        assertEquals(new MagicNumber("c", 3), root.getLeft().getData());
        assertEquals(0, root.getLeft().getHeight());
        assertEquals(0, root.getLeft().getBalanceFactor());

        assertEquals(new MagicNumber("i", 16), root.getRight().getData());
        assertEquals(1, root.getRight().getHeight());
        assertEquals(0, root.getRight().getBalanceFactor());

        assertEquals(new MagicNumber("g", 15), root.getRight().getLeft()
                .getData());
        assertEquals(0, root.getRight().getLeft().getHeight());
        assertEquals(0, root.getRight().getLeft().getBalanceFactor());

        assertEquals(new MagicNumber("k", 20), root.getRight().getRight()
                .getData());
        assertEquals(0, root.getRight().getRight().getHeight());
        assertEquals(0, root.getRight().getRight().getBalanceFactor());

        assertEquals(new MagicNumber("i", 16), avlMagicNumber
                .remove(new MagicNumber("i", 16)));

        assertTrue(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(4, avlMagicNumber.size());

        assertEquals(new MagicNumber("f", 10), root.getData());
        assertEquals(2, root.getHeight());
        assertEquals(-1, root.getBalanceFactor());

        assertEquals(new MagicNumber("c", 3), root.getLeft().getData());
        assertEquals(0, root.getLeft().getHeight());
        assertEquals(0, root.getLeft().getBalanceFactor());

        assertEquals(new MagicNumber("k", 20), root.getRight().getData());
        assertEquals(1, root.getRight().getHeight());
        // assertEquals(1, root.getRight().getBalanceFactor());

        assertEquals(new MagicNumber("g", 15), root.getRight().getLeft()
                .getData());
        assertEquals(0, root.getRight().getLeft().getHeight());
        assertEquals(0, root.getRight().getLeft().getBalanceFactor());

        assertEquals(new MagicNumber("f", 10), avlMagicNumber
                .remove(new MagicNumber("f", 10)));

        assertTrue(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(3, avlMagicNumber.size());

        root = avlMagicNumber.getRoot();

        assertEquals(new MagicNumber("g", 15), root.getData());
        // assertEquals(1, root.getHeight());
        // assertEquals(0, root.getBalanceFactor());

        assertEquals(new MagicNumber("k", 20), root.getRight().getData());
        // assertEquals(0, root.getRight().getHeight());
        assertEquals(0, root.getRight().getBalanceFactor());

        assertEquals(new MagicNumber("c", 3), root.getLeft().getData());
        assertEquals(0, root.getLeft().getHeight());
        assertEquals(0, root.getLeft().getBalanceFactor());
        testEverything2(root);
    }

    public void testEverything2(Node<MagicNumber> root) {
        avlMagicNumber.add(new MagicNumber("h", 16));
        avlMagicNumber.add(new MagicNumber("l", 21));
        avlMagicNumber.add(new MagicNumber("a", 1));
        avlMagicNumber.add(new MagicNumber("d", 4));
        assertTrue(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("h", 16)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("l", 21)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("a", 1)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("d", 4)));
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(7, avlMagicNumber.size());
        assertEquals(new MagicNumber("g", 15), root.getData());
        assertEquals(2, root.getHeight());
        assertEquals(0, root.getBalanceFactor());
        assertEquals(new MagicNumber("k", 20), root.getRight().getData());
        assertEquals(1, root.getRight().getHeight());
        assertEquals(0, root.getRight().getBalanceFactor());
        assertEquals(new MagicNumber("c", 3), root.getLeft().getData());
        assertEquals(1, root.getLeft().getHeight());
        assertEquals(0, root.getLeft().getBalanceFactor());
        assertEquals(new MagicNumber("h", 16), root.getRight().getLeft()
                .getData());
        assertEquals(0, root.getRight().getLeft().getHeight());
        assertEquals(0, root.getRight().getLeft().getBalanceFactor());
        assertEquals(new MagicNumber("l", 21), root.getRight().getRight()
                .getData());
        assertEquals(0, root.getRight().getRight().getHeight());
        assertEquals(0, root.getRight().getRight().getBalanceFactor());
        assertEquals(new MagicNumber("a", 1), root.getLeft().getLeft()
                .getData());
        assertEquals(0, root.getLeft().getLeft().getHeight());
        assertEquals(0, root.getLeft().getLeft().getBalanceFactor());
        assertEquals(new MagicNumber("d", 4), root.getLeft().getRight()
                .getData());
        assertEquals(0, root.getLeft().getRight().getHeight());
        assertEquals(0, root.getLeft().getRight().getBalanceFactor());

        System.out.println("Removing g----------------");
        assertEquals(new MagicNumber("g", 15), avlMagicNumber
                .remove(new MagicNumber("g", 15)));

        assertTrue(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("h", 16)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("l", 21)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("a", 1)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("d", 4)));
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(6, avlMagicNumber.size());

        assertEquals(new MagicNumber("h", 16), root.getData());
        assertEquals(2, root.getHeight());
        assertEquals(0, root.getBalanceFactor());

        assertEquals(new MagicNumber("k", 20), root.getRight().getData());
        assertEquals(1, root.getRight().getHeight());
        // assertEquals(-1, root.getRight().getBalanceFactor());

        assertEquals(new MagicNumber("l", 21), root.getRight().getRight()
                .getData());
        assertEquals(0, root.getRight().getRight().getHeight());
        assertEquals(0, root.getRight().getRight().getBalanceFactor());

        assertEquals(new MagicNumber("l", 21), avlMagicNumber
                .remove(new MagicNumber("l", 21)));

        assertTrue(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("h", 16)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("l", 21)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("a", 1)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("d", 4)));
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(5, avlMagicNumber.size());

        assertEquals(new MagicNumber("h", 16), root.getData());
        assertEquals(2, root.getHeight());
        assertEquals(1, root.getBalanceFactor());

        assertEquals(new MagicNumber("k", 20), root.getRight().getData());
        assertEquals(0, root.getRight().getHeight());
        assertEquals(0, root.getRight().getBalanceFactor());

        assertEquals(new MagicNumber("a", 1), avlMagicNumber
                .remove(new MagicNumber("a", 1)));

        assertTrue(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("h", 16)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("l", 21)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("a", 1)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("d", 4)));
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(4, avlMagicNumber.size());

        assertEquals(new MagicNumber("h", 16), root.getData());
        assertEquals(2, root.getHeight());
        assertEquals(1, root.getBalanceFactor());

        assertEquals(new MagicNumber("c", 3), root.getLeft().getData());
        assertEquals(1, root.getLeft().getHeight());
        assertEquals(-1, root.getLeft().getBalanceFactor());

        assertEquals(new MagicNumber("c", 3), avlMagicNumber
                .remove(new MagicNumber("c", 3)));

        assertFalse(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("h", 16)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("l", 21)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("a", 1)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("d", 4)));
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(3, avlMagicNumber.size());

        root = avlMagicNumber.getRoot();

        assertEquals(new MagicNumber("h", 16), root.getData());
        assertEquals(1, root.getHeight());
        assertEquals(0, root.getBalanceFactor());

        assertEquals(new MagicNumber("d", 4), root.getLeft().getData());
        assertEquals(0, root.getLeft().getHeight());
        assertEquals(0, root.getLeft().getBalanceFactor());

        assertEquals(new MagicNumber("k", 20), root.getRight().getData());
        assertEquals(0, root.getRight().getHeight());
        assertEquals(0, root.getRight().getBalanceFactor());

        assertEquals(new MagicNumber("d", 4), avlMagicNumber
                .remove(new MagicNumber("d", 4)));
        testEverything3(root);
    }

    public void testEverything3(Node<MagicNumber> root) {
        assertFalse(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("h", 16)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("l", 21)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("a", 1)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("d", 4)));
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(2, avlMagicNumber.size());

        assertEquals(new MagicNumber("h", 16), root.getData());
        assertEquals(1, root.getHeight());
        assertEquals(-1, root.getBalanceFactor());

        assertEquals(new MagicNumber("k", 20), root.getRight().getData());
        assertEquals(0, root.getRight().getHeight());
        assertEquals(0, root.getRight().getBalanceFactor());

        assertEquals(new MagicNumber("h", 16), avlMagicNumber
                .remove(new MagicNumber("h", 16)));

        assertFalse(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertTrue(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("h", 16)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("l", 21)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("a", 1)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("d", 4)));
        assertFalse(avlMagicNumber.isEmpty());
        assertEquals(1, avlMagicNumber.size());

        assertEquals(new MagicNumber("k", 20), avlMagicNumber.getRoot()
                .getData());
        assertEquals(0, avlMagicNumber.getRoot().getHeight());
        assertEquals(0, avlMagicNumber.getRoot().getBalanceFactor());

        assertEquals(new MagicNumber("k", 20), avlMagicNumber
                .remove(new MagicNumber("k", 20)));

        assertFalse(avlMagicNumber.contains(new MagicNumber("c", 3)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("f", 10)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("k", 20)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("g", 15)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("i", 16)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("h", 16)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("l", 21)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("a", 1)));
        assertFalse(avlMagicNumber.contains(new MagicNumber("d", 4)));
        assertTrue(avlMagicNumber.isEmpty());
        assertEquals(0, avlMagicNumber.size());

        assertEquals(null, avlMagicNumber.getRoot());

        avlMagicNumber.add(new MagicNumber("h", 16));
        avlMagicNumber.clear();
        assertTrue(avlMagicNumber.isEmpty());
    }

    private AVL<Integer> integerList;

    @Before
    public void setUp() throws Exception {
        integerList = new AVL<Integer>();
    }

    @Test(timeout = 250)
    public void basicAddNoRotation() {
        Node<Integer> root = integerList.getRoot();
        testNode(root, null, null, null, 0, true, 0);

        integerList.add(2); // Adding 2
        integerList.add(2);
        root = integerList.getRoot();
        testNode(root, 2, null, null, 1, false, 0);

        integerList.add(2);
        integerList.add(1); // Adding 1
        root = integerList.getRoot();
        testNode(root, 2, 1, null, 2, false, 1);
        testNode(root.getLeft(), 1, null, null, 2, false, 0);

        integerList.add(1);
        integerList.add(3); // Adding 3
        root = integerList.getRoot();
        testNode(root, 2, 1, 3, 3, false, 1);
        testNode(root.getLeft(), 1, null, null, 3, false, 0);
        testNode(root.getRight(), 3, null, null, 3, false, 0);

        assertEquals("Did not remove correct data", new Integer(3), integerList
                .remove(3));
        assertNull("Did not correctly remove nonexistent data", integerList
                .remove(3));
        root = integerList.getRoot();
        testNode(root, 2, 1, null, 2, false, 1);
        testNode(root.getLeft(), 1, null, null, 2, false, 0);

        assertEquals("Did not remove correct data", new Integer(2), integerList
                .remove(2));
        assertNull("Did not correctly remove nonexistent data", integerList
                .remove(2));
        root = integerList.getRoot();
        testNode(root, 1, null, null, 1, false, 0);

        assertEquals("Did not remove correct data", new Integer(1), integerList
                .remove(1));
        assertNull("Did not correctly remove nonexistent data", integerList
                .remove(1));
        root = integerList.getRoot();
        testNode(root, null, null, null, 0, true, 0);
    }

    @Test(timeout = 250)
    public void basicAddSingleRotation() {
        Node<Integer> root = integerList.getRoot();
        testNode(root, null, null, null, 0, true, 0);

        integerList.add(1); // Adding 1
        integerList.add(1);
        root = integerList.getRoot();
        testNode(root, 1, null, null, 1, false, 0);

        integerList.add(1);
        integerList.add(2); // Adding 2
        root = integerList.getRoot();
        testNode(root, 1, null, 2, 2, false, 1);
        testNode(root.getRight(), 2, null, null, 2, false, 0);

        integerList.add(1);
        integerList.add(3); // Adding 3
        integerList.add(2);
        root = integerList.getRoot();
        testNode(root, 2, 1, 3, 3, false, 1);
        testNode(root.getLeft(), 1, null, null, 3, false, 0);
        testNode(root.getRight(), 3, null, null, 3, false, 0);
    }

    @Test(timeout = 250)
    public void basicAddDoubleRotation() {
        Node<Integer> root = integerList.getRoot();
        testNode(root, null, null, null, 0, true, 0);

        integerList.add(1);
        root = integerList.getRoot();
        testNode(root, 1, null, null, 1, false, 0);

        integerList.add(3);
        root = integerList.getRoot();
        testNode(root, 1, null, 3, 2, false, 1);
        testNode(root.getRight(), 3, null, null, 2, false, 0);

        integerList.add(2);
        root = integerList.getRoot();
        testNode(root, 2, 1, 3, 3, false, 1);
        testNode(root.getLeft(), 1, null, null, 3, false, 0);
        testNode(root.getRight(), 3, null, null, 3, false, 0);
    }

    @Test(timeout = 250)
    public void complexAddNoRotation() {
        Node<Integer> root = integerList.getRoot();
        testNode(root, null, null, null, 0, true, 0);

        integerList.add(4); // Adding 4
        integerList.add(4);
        root = integerList.getRoot();
        testNode(root, 4, null, null, 1, false, 0);

        integerList.add(2); // Adding 2
        integerList.add(4);
        integerList.add(2);
        root = integerList.getRoot();
        testNode(root, 4, 2, null, 2, false, 1);
        testNode(root.getLeft(), 2, null, null, 2, false, 0);

        integerList.add(6); // Adding 6
        integerList.add(4);
        integerList.add(2);
        root = integerList.getRoot();
        testNode(root, 4, 2, 6, 3, false, 1);
        testNode(root.getLeft(), 2, null, null, 3, false, 0);
        testNode(root.getRight(), 6, null, null, 3, false, 0);

        integerList.add(1); // Adding 1
        integerList.add(6);
        root = integerList.getRoot();
        testNode(root, 4, 2, 6, 4, false, 2);
        testNode(root.getLeft(), 2, 1, null, 4, false, 1);
        testNode(root.getLeft().getLeft(), 1, null, null, 4, false, 0);
        testNode(root.getRight(), 6, null, null, 4, false, 0);

        integerList.add(5); // Adding 5
        integerList.add(6);
        integerList.add(4);
        root = integerList.getRoot();
        testNode(root, 4, 2, 6, 5, false, 2);
        testNode(root.getLeft(), 2, 1, null, 5, false, 1);
        testNode(root.getLeft().getLeft(), 1, null, null, 5, false, 0);
        testNode(root.getRight(), 6, 5, null, 5, false, 1);
        testNode(root.getRight().getLeft(), 5, null, null, 5, false, 0);

        integerList.add(7); // Adding 7
        integerList.add(1);
        integerList.add(7);
        root = integerList.getRoot();
        testNode(root, 4, 2, 6, 6, false, 2);
        testNode(root.getLeft(), 2, 1, null, 6, false, 1);
        testNode(root.getLeft().getLeft(), 1, null, null, 6, false, 0);
        testNode(root.getRight(), 6, 5, 7, 6, false, 1);
        testNode(root.getRight().getLeft(), 5, null, null, 6, false, 0);
        testNode(root.getRight().getRight(), 7, null, null, 6, false, 0);

        integerList.add(3); // Adding 3
        root = integerList.getRoot();
        testNode(root, 4, 2, 6, 7, false, 2);
        testNode(root.getLeft(), 2, 1, 3, 7, false, 1);
        testNode(root.getLeft().getLeft(), 1, null, null, 7, false, 0);
        testNode(root.getLeft().getRight(), 3, null, null, 7, false, 0);
        testNode(root.getRight(), 6, 5, 7, 7, false, 1);
        testNode(root.getRight().getLeft(), 5, null, null, 7, false, 0);
        testNode(root.getRight().getRight(), 7, null, null, 7, false, 0);
    }

    @Test(timeout = 250)
    public void complexAddBothRotations() {
        Node<Integer> root = integerList.getRoot();
        testNode(root, null, null, null, 0, true, 0);

        integerList.add(4); // Adding 4
        root = integerList.getRoot();
        testNode(root, 4, null, null, 1, false, 0);

        integerList.add(6); // Adding 6
        root = integerList.getRoot();
        testNode(root, 4, null, 6, 2, false, 1);
        testNode(root.getRight(), 6, null, null, 2, false, 0);

        integerList.add(7);
        root = integerList.getRoot();
        testNode(root, 6, 4, 7, 3, false, 1);
        testNode(root.getLeft(), 4, null, null, 3, false, 0);
        testNode(root.getRight(), 7, null, null, 3, false, 0);

        integerList.add(2);
        root = integerList.getRoot();
        testNode(root, 6, 4, 7, 4, false, 2);
        testNode(root.getLeft(), 4, 2, null, 4, false, 1);
        testNode(root.getLeft().getLeft(), 2, null, null, 4, false, 0);
        testNode(root.getRight(), 7, null, null, 4, false, 0);

        integerList.add(3);
        root = integerList.getRoot();
        testNode(root, 6, 3, 7, 5, false, 2);
        testNode(root.getLeft(), 3, 2, 4, 5, false, 1);
        testNode(root.getLeft().getLeft(), 2, null, null, 5, false, 0);
        testNode(root.getLeft().getRight(), 4, null, null, 5, false, 0);
        testNode(root.getRight(), 7, null, null, 5, false, 0);

        integerList.add(1);
        root = integerList.getRoot();
        testNode(root, 3, 2, 6, 6, false, 2);
        testNode(root.getLeft(), 2, 1, null, 6, false, 1);
        testNode(root.getLeft().getLeft(), 1, null, null, 6, false, 0);
        testNode(root.getRight(), 6, 4, 7, 6, false, 1);
        testNode(root.getRight().getLeft(), 4, null, null, 6, false, 0);
        testNode(root.getRight().getRight(), 7, null, null, 6, false, 0);

        integerList.add(5);
        root = integerList.getRoot();
        testNode(root, 3, 2, 6, 7, false, 3);
        testNode(root.getLeft(), 2, 1, null, 7, false, 1);
        testNode(root.getLeft().getLeft(), 1, null, null, 7, false, 0);
        testNode(root.getRight(), 6, 4, 7, 7, false, 2);
        testNode(root.getRight().getLeft(), 4, null, 5, 7, false, 1);
        testNode(root.getRight().getLeft().getRight(), 5, null, null, 7, false,
                0);
        testNode(root.getRight().getRight(), 7, null, null, 7, false, 0);

        integerList.add(9);
        root = integerList.getRoot();
        testNode(root, 3, 2, 6, 8, false, 3);
        testNode(root.getLeft(), 2, 1, null, 8, false, 1);
        testNode(root.getLeft().getLeft(), 1, null, null, 8, false, 0);
        testNode(root.getRight(), 6, 4, 7, 8, false, 2);
        testNode(root.getRight().getLeft(), 4, null, 5, 8, false, 1);
        testNode(root.getRight().getLeft().getRight(), 5, null, null, 8, false,
                0);
        testNode(root.getRight().getRight(), 7, null, 9, 8, false, 1);
        testNode(root.getRight().getRight().getRight(), 9, null, null, 8,
                false, 0);

        integerList.add(8);
        root = integerList.getRoot();
        testNode(root, 3, 2, 6, 9, false, 3);
        testNode(root.getLeft(), 2, 1, null, 9, false, 1);
        testNode(root.getLeft().getLeft(), 1, null, null, 9, false, 0);
        testNode(root.getRight(), 6, 4, 8, 9, false, 2);
        testNode(root.getRight().getLeft(), 4, null, 5, 9, false, 1);
        testNode(root.getRight().getLeft().getRight(), 5, null, null, 9, false,
                0);
        testNode(root.getRight().getRight(), 8, 7, 9, 9, false, 1);
        testNode(root.getRight().getRight().getLeft(), 7, null, null, 9, false,
                0);
        testNode(root.getRight().getRight().getRight(), 9, null, null, 9,
                false, 0);

        assertEquals("Did not remove correctly", new Integer(3), integerList
                .remove(3));
        root = integerList.getRoot();
        testNode(root, 4, 2, 6, 8, false, 3);
        testNode(root.getLeft(), 2, 1, null, 8, false, 1);
        testNode(root.getLeft().getLeft(), 1, null, null, 8, false, 0);
        testNode(root.getRight(), 6, 5, 8, 8, false, 2);
        testNode(root.getRight().getLeft(), 5, null, null, 8, false, 0);
        testNode(root.getRight().getRight(), 8, 7, 9, 8, false, 1);
        testNode(root.getRight().getRight().getLeft(), 7, null, null, 8, false,
                0);
        testNode(root.getRight().getRight().getRight(), 9, null, null, 8,
                false, 0);

        assertEquals("Did not remove correctly", new Integer(2), integerList
                .remove(2));
        root = integerList.getRoot();
        testNode(root, 6, 4, 8, 7, false, 2);
        testNode(root.getLeft(), 4, 1, 5, 7, false, 1);
        testNode(root.getLeft().getLeft(), 1, null, null, 7, false, 0);
        testNode(root.getLeft().getRight(), 5, null, null, 7, false, 0);
        testNode(root.getRight(), 8, 7, 9, 7, false, 1);
        testNode(root.getRight().getLeft(), 7, null, null, 7, false, 0);
        testNode(root.getRight().getRight(), 9, null, null, 7, false, 0);

        assertEquals("Did not remove correctly", new Integer(1), integerList
                .remove(1));
        assertNull("Did not check remove", integerList.remove(1));
        assertEquals("Did not remove correctly", new Integer(4), integerList
                .remove(4));
        assertEquals("Did not remove correctly", new Integer(5), integerList
                .remove(5));
        root = integerList.getRoot();
        testNode(root, 8, 6, 9, 4, false, 2);
        testNode(root.getLeft(), 6, null, 7, 4, false, 1);
        testNode(root.getLeft().getRight(), 7, null, null, 4, false, 0);
        testNode(root.getRight(), 9, null, null, 4, false, 0);
    }

    private void testNode(Node<Integer> node, Integer data, Integer left,
            Integer right, int size, boolean empty, int height) {
        if (node != null) {
            assertEquals("Incorrect data", data, node.getData());
            if (left == null) {
                assertNull("Left node was not null", node.getLeft());
            } else {
                assertEquals("Incorrect left data", left, node.getLeft()
                        .getData());
            }
            if (right == null) {
                assertNull("Right node was not null", node.getRight());
            } else {
                assertEquals("Incorrect right data", right, node.getRight()
                        .getData());
            }
            assertEquals("Incorrect height", height, node.getHeight());
        }
        assertEquals("Incorrect size", size, integerList.size());
        if (empty) {
            assertTrue("Incorrect emptiness", integerList.isEmpty());
        } else {
            assertFalse("Incorrect emptiness", integerList.isEmpty());
        }
    }

    /**
     * equals, getKey, getValue, setValue are required by the Map.Entry<K,V>
     * interface also, the hacking required to get this working frightens me,
     * java generics are quite possibly one of the dumbest things in the
     * universe
     *
     * This class also has a nice counter for keeping track of the number of
     * compareTo calls used for BigO tracking that is better than just adding
     * 10000 things to a tree.
     */
    @SuppressWarnings("hiding")
    private static class Student<String extends Comparable<String>, Integer>
            implements Map.Entry<String, Integer>,
            Comparable<Student<String, Integer>> {
        private static int counter = 0;
        private String key;
        private Integer value;

        /**
         * A constructor for the student class, not strictly required, but it
         * will simplify things
         *
         * @param name
         *            - the name of the student
         * @param grade
         *            - the grade the student has in the course
         */
        public Student(String name, Integer grade) {
            this.key = name;
            this.value = grade;
        }

        /**
         * sets the counter back to zero
         */
        @SuppressWarnings("unused")
        public static void resetCounter() {
            Student.counter = 0;
        }

        @SuppressWarnings("unused")
        public static int getCounter() {
            return Student.counter;
        }

        @SuppressWarnings("rawtypes")
        @Override
        public boolean equals(Object o) {
            if (o == null) {
                return false;
            }
            if (!(o instanceof Student)) {
                return false;
            }
            if (((Student) o).getKey() == this.key) {
                return true;
            }
            return false;
        }

        @Override
        public String getKey() {
            return this.key;
        }

        @Override
        public Integer getValue() {
            return this.value;
        }

        @Override
        public Integer setValue(Integer value) {
            Integer old = this.value;
            this.value = value;
            return old;
        }

        @Override
        public int compareTo(Student<String, Integer> o) {
            Student.counter++;
            return this.key.compareTo(o.getKey());
        }
    }

    /**
     * So now we have a Student class. This class is the kind of thing that
     * java.util.TreeMap might return. The most obvious difference between the
     * interface that TreeMap follows and the interface our AVL tree uses is
     * that the TreeMap hides the instantiation of the MapEntry inside the put
     * method. Our AVL tree requires that you create the item before adding it.
     */

    private AVL<Student<String, Integer>> cs1332;

    /**
     * Now, lets say that Monica is wanting to use our new tool to keep track of
     * her class. She decided to put all of the students into it and then use it
     * to look up their grades when she forgets.
     */

    @Test(timeout = 250)
    public void exampleTest() {
        cs1332.add(new Student<String, Integer>("Josh", 100));
        cs1332.add(new Student<String, Integer>("Emeke", 90));
        cs1332.add(new Student<String, Integer>("Alana", 25));
        cs1332.add(new Student<String, Integer>("Mitchell", 50));
        // obviously, Tech has been downsizing its classes
        // now that Monica needs to check grades again at the end of the
        // semester, she forgot mine, so she uses the
        // get method that the class provides. She forgot my grade though and
        // wants to be able to find it without
        // having to know it to begin with, so she does this:
        cs1332.get(new Student<String, Integer>("Josh", null));

        // and now lets be sure that it works:
        assertEquals(new Integer(100), cs1332.get(
                new Student<String, Integer>("Josh", null)).getValue());
        // looks like I'm getting a 100 in 1332
        // or at least a guy can hope
    }

    /**
     * Now for some actual JUnits that do actual things and don't suck.
     */

    /**
     * tests a subset of rotations when only adding nodes This currently tests
     * right rotation at root left-right rotation at root where some rotated
     * nodes have additional children
     */
    @Test(timeout = 250)
    public void testAdditionsOne() {
        cs1332.add(new Student<String, Integer>("Aron", 100));
        assertEquals("You're tree is broken and adding things doesn't work",
                "Aron", cs1332.getRoot().getData().getKey());
        cs1332.add(new Student<String, Integer>("Emeke", 80));
        cs1332.add(new Student<String, Integer>("Josh", 92));
        // this causes a root level left rotation
        assertEquals("You're tree doesn't rotate left", "Emeke", cs1332
                .getRoot().getData().getKey());
        assertEquals("You're tree doesn't rotate left", "Aron", cs1332
                .getRoot().getLeft().getData().getKey());
        assertEquals("You're tree doesn't rotate left", "Josh", cs1332
                .getRoot().getRight().getData().getKey());
        cs1332.add(new Student<String, Integer>("Alana", 86));
        cs1332.add(new Student<String, Integer>("Craig", 95));
        cs1332.add(new Student<String, Integer>("Carey", 78));
        // this causes a complex rotation
        /**
         * E Cr / \ / \ Ar J -> Ar E / \ / \ \ Al Cr Al Ca J / Ca
         */
        assertEquals("A root level Left-Right rotation doesn't work", "Craig",
                cs1332.getRoot().getData().getKey());
        assertEquals("A root level Left-Right rotation doesn't work", "Aron",
                cs1332.getRoot().getLeft().getData().getKey());
        assertEquals("A root level Left-Right rotation doesn't work", "Alana",
                cs1332.getRoot().getLeft().getLeft().getData().getKey());
        assertEquals("A root level Left-Right rotation doesn't work", "Carey",
                cs1332.getRoot().getLeft().getRight().getData().getKey());
        assertEquals("A root level Left-Right rotation doesn't work", "Emeke",
                cs1332.getRoot().getRight().getData().getKey());
        assertEquals("A root level Left-Right rotation doesn't work", "Josh",
                cs1332.getRoot().getRight().getRight().getData().getKey());
    }

    /**
     * tests a subset of rotations when only adding nodes This currently tests
     * left rotation at root right-left at root with additional children
     */
    @Test(timeout = 250)
    public void testAdditionsTwo() {
        cs1332.add(new Student<String, Integer>("Josh", 92));
        assertEquals("You're tree is broken and adding things doesn't work",
                "Josh", cs1332.getRoot().getData().getKey());
        cs1332.add(new Student<String, Integer>("Emeke", 80));
        cs1332.add(new Student<String, Integer>("Aron", 100));
        assertEquals("You're tree doesn't rotate left", "Emeke", cs1332
                .getRoot().getData().getKey());
        assertEquals("You're tree doesn't rotate left", "Aron", cs1332
                .getRoot().getLeft().getData().getKey());
        assertEquals("You're tree doesn't rotate left", "Josh", cs1332
                .getRoot().getRight().getData().getKey());
        cs1332.add(new Student<String, Integer>("Ian", 82));
        cs1332.add(new Student<String, Integer>("Kirsten", 86));
        cs1332.add(new Student<String, Integer>("Issac", 73));
        // this also causes a similarly complex rotation
        /**
         * E Ia / \ / \ A J -> E J / \ / / \ Ia K A Is K \ Is
         */
        assertEquals("A root level Right-Left rotation doesn't work", "Ian",
                cs1332.getRoot().getData().getKey());
        assertEquals("A root level Left-Right rotation doesn't work", "Emeke",
                cs1332.getRoot().getLeft().getData().getKey());
        assertEquals("A root level Left-Right rotation doesn't work", "Aron",
                cs1332.getRoot().getLeft().getLeft().getData().getKey());
        assertEquals("A root level Left-Right rotation doesn't work", "Josh",
                cs1332.getRoot().getRight().getData().getKey());
        assertEquals("A root level Left-Right rotation doesn't work",
                "Kirsten", cs1332.getRoot().getRight().getRight().getData()
                        .getKey());
        assertEquals("A root level Left-Right rotation doesn't work", "Issac",
                cs1332.getRoot().getRight().getLeft().getData().getKey());
    }
}
