import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class BST<T extends Comparable<T>> implements BSTInterface<T> {
    private int size = 0;
    private Node<T> root = null;

    @Override
    public void add(T data) {
        if (root == null) {
            root = new Node<T>(data);
            size++;
        } else {
            this.addToNode(root, data);
            size++;
        }
    }

    /**
     * Adds the data to the specified node. Continues down the tree if the
     * node has both children spots filled.
     *
     * @param node - The node to which to add data.
     * @param data - The data to add to the node.
     */
    private void addToNode(Node<T> node, T data) {
        if (node.getData().compareTo(data) > 0) {
            if (node.getLeft() == null) {
                node.setLeft(new Node<T>(data));
            } else {
                this.addToNode(node.getLeft(), data);
            }
        } else {
            if (node.getRight() == null) {
                node.setRight(new Node<T>(data));
            } else {
                this.addToNode(node.getRight(), data);
            }
        }
    }

//    @Override
//    public T remove(T data) {
//        T dataOut = removeKeepSize(data);
//        if (dataOut != null) {
//            size--;
//        }
//        return dataOut;
//    }

    @Override
    public T remove(T data) {
        T dataOut;
        if (!contains(data)) {
            return null;
        }
        Node<T> current = root;
        Node<T> parent = root;
        //find parent of the node to remove
        while (current != null) {
            if (current.getData().compareTo(data) > 0) {
                parent = current;
                current = current.getLeft();
            } else if (current.getData().compareTo(data) < 0) {
                parent = current;
                current = current.getRight();
            } else {
                break;
            }
        }
        if (current == null) {
            return null;
        }
        dataOut = current.getData();
        //remove the node
        if (current.getLeft() == null && current.getRight() == null) {
            //case 1: no children
            if (parent.getLeft().getData().compareTo(current.getData()) == 0) {
                if (parent == current) {
                    root = null; //case where data is in root
                } else {
                    parent.setLeft(null);
                }
            } else {
                if (parent == current) {
                    root = null; //case where data is in root
                } else {
                    parent.setRight(null);
                }
            }
        } else if (current.getRight() == null) {
            //case 2a: one child (left)
            if (parent.getLeft().getData().compareTo(current.getData()) == 0) {
                if (parent == current) {
                    root = current.getLeft(); //case where data is in root
                } else {
                    parent.setLeft(current.getLeft());
                }
            } else {
                if (parent == current) {
                    root = current.getLeft(); //case where data is in root
                } else {
                    parent.setRight(current.getRight());
                }
            }
        } else if (current.getLeft() == null) {
            //case 2b: one child (right)
            if (parent.getLeft().getData().compareTo(current.getData()) == 0) {
                if (parent == current) {
                    root = current.getRight(); //case where data is in root
                } else {
                    parent.setLeft(current.getRight());
                }
            } else {
                if (parent == current) {
                    root = current.getRight(); //case where data is in root
                } else {
                    parent.setRight(current.getRight());
                }
            }
        } else {
            //case 3: two children
            //find predecessor:
            Node<T> pred = current.getLeft();
            Node<T> predParent = current;
            while (pred.getRight() != null) {
                predParent = pred;
                pred = pred.getRight();
            }
            //replace data:
            current.setData(pred.getData());
            //remove predecessor
            if (pred.getLeft() == null) {
                predParent.setRight(null);
            } else {
                predParent.setRight(pred.getLeft());
            }
        }
        size--;
        return dataOut;
    }

    @Override
    public T get(T data) {
        Node<T> container = binarySearch(data);
        if (container == null) {
            return null;
        }
        return container.getData();
    }

    @Override
    public boolean contains(T data) {
        return (binarySearch(data) != null);
    }

    /**
     * Returns the node which contains the specified data
     * @param data - the value to search for
     * @return the node containing the data, null if the data is not in the tree
     */
    private Node<T> binarySearch(T data) {
        if (root == null) {
            return null;
        }
        Node<T> current = root;
        while (current.getData().compareTo(data) != 0) {
            if (current.getData().compareTo(data) < 0) {
                if (current.getRight() == null) {
                    return null;
                }
                current = current.getRight();
            } else {
                if (current.getLeft() == null) {
                    return null;
                }
                current = current.getLeft();
            }
        }
        return current;
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public List<T> preorder() {
        if (root == null) {
            return new ArrayList<T>(0);
        }
        List<T> preorderList = new ArrayList<T>(size);
        preorderList.add(root.getData());
        if (root.getLeft() != null) {
            preorderList = preTraversal(preorderList, root.getLeft());
        }
        if (root.getRight() != null) {
            preorderList = preTraversal(preorderList, root.getRight());
        }
        return preorderList;
    }

    /**
     * Traverses the BST recursively, returning the pre-order list.
     * @param workingList - the list holding the traversal data
     * @param workingNode - The node to start with
     * @return the traversal list
     */
    private List<T> preTraversal(List<T> workingList, Node<T> workingNode) {
        workingList.add(workingNode.getData());
        if (workingNode.getLeft() != null) {
            workingList = preTraversal(workingList, workingNode.getLeft());
        }
        if (workingNode.getRight() != null) {
            workingList = preTraversal(workingList, workingNode.getRight());
        }
        return workingList;
    }

    @Override
    public List<T> postorder() {
        if (root == null) {
            return new ArrayList<T>(0);
        }
        List<T> postorderList = new ArrayList<T>(size);
        if (root.getLeft() != null) {
            postorderList = postTraversal(postorderList, root.getLeft());
        }
        if (root.getRight() != null) {
            postorderList = postTraversal(postorderList, root.getRight());
        }
        postorderList.add(root.getData());
        return postorderList;
    }

    /**
     * Traverses the BST recursively, returning the in-order list.
     * @param workingList - the list holding the traversal data
     * @param workingNode - The node to start with
     * @return the traversal list
     */
    private List<T> postTraversal(List<T> workingList, Node<T> workingNode) {
        if (workingNode.getLeft() != null) {
            workingList = postTraversal(workingList, workingNode.getLeft());
        }
        if (workingNode.getRight() != null) {
            workingList = postTraversal(workingList, workingNode.getRight());
        }
        workingList.add(workingNode.getData());
        return workingList;
    }

    @Override
    public List<T> inorder() {
        if (root == null) {
            return new ArrayList<T>(0);
        }
        List<T> inorderList = new ArrayList<T>(size);
        if (root.getLeft() != null) {
            inorderList = inTraversal(inorderList, root.getLeft());
        }
        inorderList.add(root.getData());
        if (root.getRight() != null) {
            inorderList = inTraversal(inorderList, root.getRight());
        }
        return inorderList;
    }

    /**
     * Traverses the BST recursively, returning the in-order list.
     * @param workingList - the list holding the traversal data
     * @param workingNode - The node to start with
     * @return the traversal list
     */
    private List<T> inTraversal(List<T> workingList, Node<T> workingNode) {
        if (workingNode.getLeft() != null) {
            workingList = inTraversal(workingList, workingNode.getLeft());
        }
        workingList.add(workingNode.getData());
        if (workingNode.getRight() != null) {
            workingList = inTraversal(workingList, workingNode.getRight());
        }
        return workingList;
    }

    @Override
    public List<T> levelorder() {
        List<T> levelList = new ArrayList<T>(size);
        LinkedList<Node<T>> queue = new LinkedList<Node<T>>();
        Node<T> current = root;
        while (current != null) {
            levelList.add(current.getData());
            if (current.getLeft() != null) {
                queue.add(current.getLeft());
            }
            if (current.getRight() != null) {
                queue.add(current.getRight());
            }
            try {
                current = queue.remove();
            } catch (java.util.NoSuchElementException e) {
                current = null;
            }
        }
        return levelList;
    }

    @Override
    public void clear() {
        root = null;
        size = 0;
    }

    @Override
    public int height() {
        if (root == null) {
            return -1;
        }
        return this.heightOfNode(root);
    }

    /**
     * Returns the height of the specified node.
     * @param node - the node for which to find the height
     * @return the height of the node
     */
    private int heightOfNode(Node<T> node) {
        if (node == null) {
            return -1;
        }
        if (node.getLeft() == null
                && node.getRight() == null) {
            return 0;
        }
        int leftHeight = this.heightOfNode(node.getLeft());
        int rightHeight = this.heightOfNode(node.getRight());
        return ((leftHeight > rightHeight) ? 1 + leftHeight : 1 + rightHeight);
    }

    @Override
    public Node<T> getRoot() {
        return root;
    }
}