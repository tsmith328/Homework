import java.util.ArrayList;
import java.util.List;

public class StringSearching implements StringSearchingInterface {

    @Override
    public List<Integer> boyerMoore(CharSequence pattern, CharSequence text) {
        if (pattern == null || pattern.length() == 0 || text == null) {
            throw new IllegalArgumentException();
        }
        List<Integer> starts = new ArrayList<Integer>();
        int[] lastTable = buildLastTable(pattern);
        int i = pattern.length() - 1;
        int j = pattern.length() - 1;
        while (i < text.length()) {
            char patChar = pattern.charAt(j);
            char textChar = text.charAt(i);
            if (patChar == textChar) {
                if (j == 0) {
                    starts.add(i);
                    i += pattern.length();
                    j = pattern.length() - 1;
                } else {
                    i--;
                    j--;
                }
            } else {
                i += pattern.length() - Math.min(j, 1 + lastTable[textChar]);
                j = pattern.length() - 1;
            }
        }
        return starts;
    }

    @Override
    public int[] buildLastTable(CharSequence pattern) {
        if (pattern == null) {
            throw new IllegalArgumentException();
        }
        int[] arr = new int[Character.MAX_VALUE + 1];
        // Prime the array
        for (int i = 0; i < arr.length; i++) {
            arr[i] = -1;
        }
        for (int i = 0; i < pattern.length(); i++) {
            arr[pattern.charAt(i)] = i;
        }
        return arr;
    }

    @Override
    public int generateHash(CharSequence current, int length) {
        if (current == null || length < 0 || length > current.length()) {
            throw new IllegalArgumentException();
        }
        int sum = 0;
        for (int i = 0; i < length; i++) {
            sum += current.charAt(i) * intPow(BASE, length - 1 - i);
        }
        return sum;
    }

    @Override
    public int updateHash(int oldHash, int length, char oldChar, char newChar) {
        int newHash = ((oldHash - (oldChar * intPow(BASE, length - 1))) * BASE)
                + newChar;
        return newHash;
    }

    @Override
    public List<Integer> rabinKarp(CharSequence pattern, CharSequence text) {
        if (pattern == null || text == null || pattern.length() == 0) {
            throw new IllegalArgumentException();
        }
        List<Integer> matches = new ArrayList<Integer>();
        if (text.length() > 0 && text.length() > pattern.length()) {
            int len = pattern.length();
            int patternHash = generateHash(pattern, len);
            int sampleHash = generateHash(text, len);
            int i = 0;
            while (i <= text.length() - len) {
                if (patternHash == sampleHash) {
                    // Compare strings
                    boolean match = true;
                    int j = 0;
                    while (match && j < len - i) {
                        if (pattern.charAt(i + j) != pattern.charAt(i + j)) {
                            match = false;
                        }
                        j++;
                    }
                    if (match) {
                        matches.add(i);
                    }
                }
                // Update hashes
                if (i != text.length() - len) {
                    sampleHash = updateHash(sampleHash, len, text.charAt(i),
                            text.charAt(i + len));
                }
                i++;
            }
        }
        return matches;
    }

    /**
     * A fast integer power function.
     *
     * @param base
     *            - the base of the exponential
     * @param power
     *            - the power to raise the base to
     * @return the integer which equals (base)^(power) where ^ is exponent
     */
    private int intPow(int base, int power) {
        int ret;
        if (power == 0) {
            ret = 1;
        } else if (power % 2 == 0) {
            int p = intPow(base, power / 2);
            ret = p * p;
        } else {
            ret = base * intPow(base, power - 1);
        }
        return ret;
    }
}
