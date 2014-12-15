import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Set;

public class Huffman {

    // Do NOT add any variables (instance or static)

    /**
     * Builds a frequency map of characters for the given string.
     *
     * This should just be the count of each character. No character not in the
     * input string should be in the frequency map.
     *
     * @param s
     *            the string to map
     * @return the character -> Integer frequency map
     */
    public static Map<Character, Integer> buildFrequencyMap(String s) {
        if (s == null) {
            throw new IllegalArgumentException();
        }
        char[] str = s.toCharArray();
        Map<Character, Integer> freqMap = new HashMap<Character, Integer>();
        for (int i = 0; i < str.length; i++) {
            // Only add to the map if this is a new character
            if (!freqMap.containsKey(str[i])) {
                freqMap.put(str[i], 1);
                for (int j = i + 1; j < str.length; j++) {
                    if (str[j] == str[i]) {
                        // Add one to count of this character
                        freqMap.put(str[i], freqMap.get(str[i]) + 1);
                    }
                }
            }
        }
        return freqMap;
    }

    /**
     * Build the Huffman tree using the frequencies given.
     *
     * Add the nodes to the tree based on their natural ordering (the order
     * given by the compareTo method). The frequency map will not necessarily
     * come from the {@code buildFrequencyMap()} method. Every entry in the map
     * should be in the tree.
     *
     * @param freq
     *            the frequency map to represent
     * @return the root of the Huffman Tree
     */
    public static HuffmanNode buildHuffmanTree(Map<Character, Integer> freq) {
        if (freq == null) {
            throw new IllegalArgumentException();
        }
        PriorityQueue<HuffmanNode> queue = new PriorityQueue<HuffmanNode>();
        HuffmanNode head = null;
        // Create all data nodes
        Set<Character> keys = freq.keySet();
        for (Character c : keys.toArray(new Character[keys.size()])) {
            HuffmanNode node = new HuffmanNode(c, freq.get(c));
            queue.add(node);
        }
        while (queue.size() > 1) {
            // Merge first two items in queue into splitter nodes
            queue.add(new HuffmanNode(queue.remove(), queue.remove()));
        }
        if (!queue.isEmpty()) {
            head = queue.remove();
        }
        return head;
    }

    /**
     * Traverse the tree and extract the encoding for each character in the
     * tree.
     *
     * The tree provided will be a valid Huffman tree but may not come from the
     * {@code buildHuffmanTree()} method.
     *
     * @param tree
     *            the root of the Huffman Tree
     * @return the map of each character to the encoding string it represents
     */
    public static Map<Character, EncodedString> buildEncodingMap(
            HuffmanNode tree) {
        if (tree == null) {
            throw new IllegalArgumentException();
        }
        Map<Character, EncodedString> encoding =
                new HashMap<Character, EncodedString>();
        EncodedString soFar = new EncodedString();
        encoding = buildMapTraversing(tree, encoding, soFar);
        return encoding;
    }

    /**
     * Recursively finds the EncodedString for the characters in the string.
     *
     * @param root
     *            - the root of the subtree to work on
     * @param addTo
     *            - the Map to add the Character-EncodedString pair to
     * @param prev
     *            - the EncodedString that has been built so far.
     * @return The Map with the Characters in this subtree added.
     */
    private static Map<Character, EncodedString> buildMapTraversing(
            HuffmanNode root, Map<Character, EncodedString> addTo,
            EncodedString code) {
        if (root.getCharacter() == 0) {
            // Left subtree
            code.zero();
            addTo = buildMapTraversing(root.getLeft(), addTo, code);
            code.remove();
            // Right subtree
            code.one();
            addTo = buildMapTraversing(root.getRight(), addTo, code);
            code.remove();
        } else {
            // Found a character
            if (code.isEmpty()) {
                code.zero();
            }
            addTo.put(root.getCharacter(), code);
        }
        return addTo;
    }

    /**
     * Encode each character in the string using the map provided.
     *
     * If a character in the string doesn't exist in the map ignore it.
     *
     * The encoding map may not necessarily come from the
     * {@code buildEncodingMap()} method, but will be correct for the tree given
     * to {@code decode()} when decoding this method's output.
     *
     * @param encodingMap
     *            the map of each character to the encoding string it represents
     * @param s
     *            the string to encode
     * @return the encoded string
     */
    public static EncodedString encode(
            Map<Character, EncodedString> encodingMap, String s) {
        if (s == null || encodingMap == null) {
            throw new IllegalArgumentException();
        }
        EncodedString encoding = new EncodedString();
        for (char c : s.toCharArray()) {
            EncodedString code = encodingMap.get(c);
            if (code != null) {
                encoding.concat(code);
            }
        }
        return encoding;
    }

    /**
     * Decode the encoded string using the tree provided.
     *
     * The encoded string may not necessarily come from {@code encode()}, but
     * will be a valid string for the given tree.
     *
     * (tip: use StringBuilder to make this method faster -- concatenating
     * strings is SLOW.)
     *
     * @param tree
     *            the tree to use to decode the string
     * @param es
     *            the encoded string
     * @return the decoded string
     */
    public static String decode(HuffmanNode tree, EncodedString es) {
        if (tree == null || es == null) {
            throw new IllegalArgumentException();
        }
        StringBuilder decoded = new StringBuilder();
        Iterator<Byte> esIter = es.iterator();
        while (esIter.hasNext()) {
            HuffmanNode curr = tree;
            byte code;
            while (curr.getCharacter() == 0) {
                code = esIter.next();
                if (code == 0) {
                    curr = curr.getLeft();
                } else {
                    curr = curr.getRight();
                }
            }
            decoded.append(curr.getCharacter());
        }
        return decoded.toString();
    }
}
