import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class DisjointSets<T> implements DisjointSetsInterface<T> {
    //Should be a map of data to its parent; root data maps to itself.
    private Map<T, Node> set;

    /**
     * @param setItems the initial items (sameSet and merge will never be called
     * with items not in this set, this set will never contain null elements).
     */
    public DisjointSets(Set<T> setItems) {
        set = new HashMap<T, Node>();
        for (T item : setItems) {
            set.put(item, new Node(item));
        }
    }

    @Override
    public boolean sameSet(T u, T v) {
        if (u == null || v == null) {
            throw new IllegalArgumentException();
        }
        Node uParent = this.getDisjointSet(u);
        Node vParent = this.getDisjointSet(v);
        return uParent.equals(vParent);
    }

    @Override
    public void merge(T u, T v) {
        if (u == null || v == null) {
            throw new IllegalArgumentException();
        }
        Node uParent = this.getDisjointSet(u);
        Node vParent = this.getDisjointSet(v);
        set.put(uParent.data, vParent);
        
    }

    private DisjointSets<T>.Node getDisjointSet(T data) {
        //Find root
        Node parent = set.get(data);
        while (!parent.data.equals(data)) {
            parent = set.get(parent.data);
            
        }
        return parent;
    }

    private class Node {
        //Fill in whatever methods or variables you believe are needed by node
        //here.  Should be O(1) space. This means no arrays, data structures,
        //etc.
        private T data;
        private int height;

        private Node(T data) {
            this.data = data;
            height = 0;
        }

        @SuppressWarnings("rawtypes")
        @Override
        public boolean equals(Object that) {
            if (that != null) {
                if (that instanceof DisjointSets.Node) {
                    return (this.data).equals(((DisjointSets.Node) that).data);
                }
            }
            return false;
        }
    }
}
