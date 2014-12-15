import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class HashMap<K, V> implements HashMapInterface<K, V>, Gradable<K, V> {
    // Do not make any new instance variables.
    private MapEntry<K, V>[] table;
    private int size;

    @SuppressWarnings("unchecked")
    public HashMap() {
        table = new MapEntry[STARTING_SIZE];
        size = 0;
    }

    @Override
    public V add(K key, V value) {
        if (key == null || value == null) {
            throw new IllegalArgumentException();
        }
        double loadFact = ((double) (size + 1)) / ((double) table.length);
        if (loadFact > MAX_LOAD_FACTOR) {
            regrow();
        }
        V val;
        MapEntry<K, V> entry = new MapEntry<K, V>(key, value);
        int hash = getHashCode(key, table.length);
        //first case:
        if (table[hash] == null) {
            table[hash] = entry;
            size++;
            val = null;
        //second case:
        } else if (key.equals(table[hash].getKey())) {
            if (table[hash].isRemoved()) {
                table[hash] = entry;
                size++;
                val = null;
            } else {
                val = table[hash].getValue();
                table[hash].setValue(entry.getValue());
            }
        //third case
        } else {
            int i = 0;
            while (i < table.length //looped whole table
                    && table[hash] != null //end of moved items
                    && !key.equals(table[hash].getKey())) { //found it
                hash++;
                hash %= table.length;
                i++;
            }
            if (table[hash] != null && key.equals(table[hash].getKey())) {
                if (table[hash].isRemoved()) {
                    val = null;
                    size++;
                    table[hash] = entry;
                } else {
                    val = table[hash].getValue();
                    table[hash].setValue(entry.getValue());
                }
            } else { //key isn't in table
                hash = getHashCode(key, table.length);
                while (table[hash] != null && !table[hash].isRemoved()) {
                    hash++;
                    hash %= table.length;
                }
                table[hash] = entry;
                size++;
                val = null;
            }
        }
        return val;
    }

    /**
     * Resizes the Hash Table to be twice its old size when
     * the maximum load factor is exceeded.
     */
    @SuppressWarnings("unchecked")
    private void regrow() {
        MapEntry<K, V>[] newTable = new MapEntry[table.length * 2];
        for (MapEntry<K, V> e: table) {
            if (e != null && !e.isRemoved()) {
                int newHash = getHashCode(e.getKey(), newTable.length);
                while (newTable[newHash] != null) {
                    newHash++;
                    newHash %= newTable.length;
                }
                newTable[newHash] = e;
            }
        }
        table = newTable;
    }

    @Override
    public V remove(K key) {
        if (key == null) {
            throw new IllegalArgumentException();
        }
        int hash = getHashCode(key, table.length);
        V val;
        if (table[hash] == null) {
            val = null;
        } else if (key.equals(table[hash].getKey())
                && !table[hash].isRemoved()) {
            val = table[hash].getValue();
            table[hash].setRemoved(true);
            size--;
        } else {
            int i = 0;
            while (i < table.length //looped whole table
                    && table[hash] != null //end of moved items
                    && !key.equals(table[hash].getKey())) { //found it
                hash++;
                hash %= table.length;
                i++;
            }
            if (key.equals(table[hash].getKey())) {
                if (!table[hash].isRemoved()) {
                    val = table[hash].getValue();
                    size--;
                    table[hash].setRemoved(true);
                } else {
                    val = null;
                }
            } else {
                val = null;
            }
        }
        return val;
    }

    @Override
    public V get(K key) {
        if (key == null) {
            throw new IllegalArgumentException();
        }
        V val = null;
        int hash = getHashCode(key, table.length);
        if (key.equals(table[hash].getKey())
                && !table[hash].isRemoved()) {
            val = table[hash].getValue();
        } else {
            int i = 0;
            boolean cont = true;
            while (i < table.length && cont) {
                if (key.equals(table[hash].getKey())
                    && !table[hash].isRemoved()) {
                    cont = false;
                    val = table[hash].getValue();
                }
                hash++;
                i++;
                hash %= table.length;
            }
        }
        return val;
    }

    @Override
    public boolean contains(K key) {
        if (key == null) {
            throw new IllegalArgumentException();
        }
        boolean cont = false;
        int hash = getHashCode(key, table.length);
        if (key.equals(table[hash].getKey())
                && !table[hash].isRemoved()) {
            cont = true;
        } else {
            int i = 0;
            while (i < table.length && !cont) {
                if (table[hash] != null
                        && key.equals(table[hash].getKey())
                        && !table[hash].isRemoved()) {
                    cont = true;
                }
                hash++;
                hash %= table.length;
                i++;
            }
        }
        return cont;
    }

    @SuppressWarnings("unchecked")
    @Override
    public void clear() {
        table = new MapEntry[STARTING_SIZE];
        size = 0;
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public MapEntry<K, V>[] toArray() {
        return table;
    }

    @Override
    public Set<K> keySet() {
        Set<K> set = new HashSet<K>(size);
        for (MapEntry<K, V> e: table) {
            if (e != null && !e.isRemoved()) {
                set.add(e.getKey());
            }
        }
        return set;
    }

    @Override
    public List<V> values() {
        List<V> list = new ArrayList<V>(size);
        for (MapEntry<K, V> e: table) {
            if (e != null && !e.isRemoved()) {
                list.add(e.getValue());
            }
        }
        return list;
    }

    /**
     * Gets the hash code for the key, a positive integer
     * less than the length of the table array.
     * @param key - the key item for which to get a hash code
     * @param arrLen - the length of the holding array
     * @return an integer hash code (>= 0 and < table array)
     */
    private int getHashCode(K key, int arrLen) {
        int hash = key.hashCode();
        if (hash < 0) {
            hash *= -1;
        }
        hash %= arrLen;
        return hash;
    }
}
