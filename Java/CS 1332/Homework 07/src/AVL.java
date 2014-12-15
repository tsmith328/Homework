import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * My AVL implementation.
 *
 * @author INSERT_NAME_HERE
 */
public class AVL<T extends Comparable<T>> implements AVLInterface<T>,
       Gradable<T> {

    // Do not add additional instance variables
    private Node<T> root;
    private int size;

    @Override
    public void add(T data) {
        if (data == null) {
            throw new IllegalArgumentException();
        }
        if (root == null) {
            root = new Node<T>(data);
            size++;
        } else {
            root = this.add(root, data);
        }
    }

    /**
     * Adds the data to the subtree starting at start
     * @param node - the top of the subtree
     * @param data - the data to add
     * @return the root of the subtree with the data added, null if the
     * data is already in the tree
     */
    private Node<T> add(Node<T> node, T data) {
        Node<T> newNode = null;
        if (node == null) {
            //Reached the bottom of the tree
            newNode = new Node<T>(data);
            size++;
        } else {
            if (node.getData().compareTo(data) > 0) {
                node.setLeft(this.add(node.getLeft(), data));
                this.update(node);
                node = this.balance(node);
            } else if (node.getData().compareTo(data) < 0) {
                node.setRight(this.add(node.getRight(), data));
                this.update(node);
                node = this.balance(node);
            }
            newNode = node;
        }
        return newNode;
    }

    @Override
    public T remove(T data) {
        if (data == null) {
            throw new IllegalArgumentException();
        }
        Node<T> ret = new Node<>(null);
        root = remove(root, data, ret);
        return ret.getData();
    }

    /**
     * Removes the data from the subtree whose root is node
     * @param node - the root of the subtree
     * @param data - the data to return
     * @param ret - a node to hold the removed data
     * @return the modified root of the subtree
     */
    private Node<T> remove(Node<T> node, T data, Node<T> ret) {
        if (node == null) {
            return null; //data not found
        }
        if (data.compareTo(node.getData()) < 0) {
            node.setLeft(remove(node.getLeft(), data, ret));
            this.update(node);
            node = this.balance(node);
        } else if (data.compareTo(node.getData()) > 0) {
            node.setRight(remove(node.getRight(), data, ret));
            this.update(node);
            node = this.balance(node);
        } else {
            //found it!
            size--;
            ret.setData(node.getData());
            if (node.getLeft() != null && node.getRight() != null) {
                node.setData(findSuccessor(node));
            } else if (node.getLeft() == null) {
                node = node.getRight(); //one child
            } else {
                //one child or no children
                node = node.getLeft();
            }
        }
        return node;
    }

    /**
     * Finds the successor to a node and returns its data
     * @param node - the node to start with
     * @return the data in the successor node
     */
    private T findSuccessor(Node<T> node) {
        Node<T> succ = node.getRight();
        Node<T> parent = null;
        while (succ.getLeft() != null) {
            parent = succ;
            succ = succ.getLeft();
        }
        T data = succ.getData();
        if (parent == null) {
            node.setRight(succ.getRight());
        } else {
            parent.setLeft(succ.getRight());
        }
        return data;
    }

    @Override
    public T get(T data) {
        if (data == null) {
            throw new IllegalArgumentException();
        }
        Node<T> dataNode = this.find(data);
        T dataOut;
        if (dataNode == null) {
            dataOut = null;
        } else {
            dataOut = dataNode.getData();
        }
        return dataOut;
    }

    @Override
    public boolean contains(T data) {
        if (data == null) {
            throw new IllegalArgumentException();
        }
        Node<T> dataNode = this.find(data);
        return dataNode != null;
    }

    /**
     * Attempts to find the given data in the tree.
     * @param data - the data to find in the tree.
     * @return the Node containing the data,
     * null if the data is not in the tree
     */
    private Node<T> find(T data) {
        Node<T> current = root;
        boolean found = false;
        while (!found && (current != null)) {
            if (current.getData().compareTo(data) == 0) {
                found = true;
            } else if (current.getData().compareTo(data) < 0) {
                current = current.getRight();
            } else {
                current = current.getLeft();
            }
        }
        return current;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public List<T> preorder() {
        List<T> list = new ArrayList<T>(size);
        list = preorder(list, root);
        return list;
    }

    /**
     * Recursively calculates the preorder traversal for the
     * specified node. Adds this to the input list.
     * @param list - the list to add to
     * @param myRoot - the node to start at
     * @return the preorder traversal added to the input list
     */
    private List<T> preorder(List<T> list, Node<T> myRoot) {
        if (myRoot != null) {
            list.add(myRoot.getData());
            list = preorder(list, myRoot.getLeft());
            list = preorder(list, myRoot.getRight());
        }
        return list;
    }

    @Override
    public List<T> postorder() {
        List<T> list = new ArrayList<T>(size);
        list = postorder(list, root);
        return list;
    }

    /**
     * Recursively calculates the postorder traversal for the
     * specified node. Adds this to the input list.
     * @param list - the list to add to
     * @param myRoot - the node to start at
     * @return the postorder traversal added to the input list
     */
    private List<T> postorder(List<T> list, Node<T> myRoot) {
        if (myRoot != null) {
            list = postorder(list, myRoot.getLeft());
            list = postorder(list, myRoot.getRight());
            list.add(myRoot.getData());
        }
        return list;
    }

    @Override
    public List<T> inorder() {
        List<T> list = new ArrayList<T>(size);
        list = inorder(list, root);
        return list;
    }

    /**
     * Recursively calculates the inorder traversal for the
     * specified node. Adds this to the input list.
     * @param list - the list to add to
     * @param myRoot - the node to start at
     * @return the inorder traversal added to the input list
     */
    private List<T> inorder(List<T> list, Node<T> myRoot) {
        if (myRoot != null) {
            list = inorder(list, myRoot.getLeft());
            list.add(myRoot.getData());
            list = inorder(list, myRoot.getRight());
        }
        return list;
    }

    @Override
    public List<T> levelorder() {
        List<T> outList = new ArrayList<T>(size);
        LinkedList<Node<T>> queue = new LinkedList<Node<T>>();
        Node<T> current = root;
        while (current != null) {
            outList.add(current.getData());
            if (current.getLeft() != null) {
                queue.add(current.getLeft());
            }
            if (current.getRight() != null) {
                queue.add(current.getRight());
            }
            if (!queue.isEmpty()) {
                current = queue.remove();
            } else {
                current = null;
            }
        }
        return outList;
    }

    @Override
    public void clear() {
        root = null;
        size = 0;
    }

    @Override
    public int height() {
        int h;
        if (root == null) {
            h = -1;
        } else {
            h = root.getHeight();
        }
        return h;
    }

    /**
     * Updates the Node's height and balance factor.
     * @param node - the Node to update
     */
    private void update(Node<T> node) {
        this.updateHeight(node);
        this.updateBalanceFactor(node);
    }

    /**
     * Updates the height of the specified node.
     * @param node - the node to update
     */
    private void updateHeight(Node<T> node) {
        int hl, hr;
        if (node != null) {
            hl = (node.getLeft() == null) ? -1 : node.getLeft().getHeight();
            hr = (node.getRight() == null) ? -1 : node.getRight().getHeight();
            node.setHeight((hr > hl) ? hr + 1 : hl + 1);
        }
    }

    /**
     * Updates the balance factor of the node
     * @param node - the node to update
     */
    private void updateBalanceFactor(Node<T> node) {
        int hl, hr;
        if (node != null) {
            hl = (node.getLeft() == null) ? -1 : node.getLeft().getHeight();
            hr = (node.getRight() == null) ? -1 : node.getRight().getHeight();
            node.setBalanceFactor(hl - hr);
        }
    }

    /**
     * Balances the Node so that -1 <= the balance factor <= 1
     * @param node - The Node to balance
     * @return the modified node
     */
    private Node<T> balance(Node<T> node) {
        int bf = node.getBalanceFactor();
        if (bf > 1) {
            if (node.getLeft().getBalanceFactor() < 0) {
                node = this.rotateLeftRight(node);
            } else {
                node = this.rotateRight(node);
            }
        } else if (bf < -1) {
            if (node.getRight().getBalanceFactor() > 0) {
                node = this.rotateRightLeft(node);
            } else {
                node = this.rotateLeft(node);
            }
        }
        return node;
    }

    /**
     * Performs a right rotation to balance the tree.
     * @param node - the node to rotate
     * @return the rotated subtree
     */
    private Node<T> rotateRight(Node<T> node) {
        Node<T> top = node.getLeft();
        node.setLeft(top.getRight());
        top.setRight(node);
        this.update(node);
        this.update(top);
        return top;
    }

    /**
     * Performs a left rotation to balance the tree.
     * @param node - the node to rotate
     * @return the rotated subtree
     */
    private Node<T> rotateLeft(Node<T> node) {
        Node<T> top = node.getRight();
        node.setRight(top.getLeft());
        top.setLeft(node);
        this.update(node);
        this.update(top);
        return top;
    }

    /**
     * Performs a left-right rotation on the subtree starting at node.
     * @param node - the root of the rotating subtree
     * @return the root of the new subtree
     */
    private Node<T> rotateLeftRight(Node<T> node) {
        Node<T> left = node.getLeft();
        Node<T> top = left.getRight();
        left.setRight(top.getLeft());
        top.setLeft(left);
        node.setLeft(top.getRight());
        top.setRight(node);
        this.update(left);
        this.update(node);
        this.update(top);
        return top;
    }

    /**
     * Performs a right-left rotation on the subtree starting at node.
     * @param node - the root of the rotating subtree
     * @return the root of the new subtree
     */
    private Node<T> rotateRightLeft(Node<T> node) {
        Node<T> right = node.getRight();
        Node<T> top = right.getLeft();
        right.setLeft(top.getRight());
        top.setRight(right);
        node.setRight(top.getLeft());
        top.setLeft(node);
        this.update(right);
        this.update(node);
        this.update(top);
        return top;
    }

    @Override
    public Node<T> getRoot() {
        return root;
    }
}
