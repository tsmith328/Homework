import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.runners.MethodSorters;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;

@SuppressWarnings("unused")
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class StudentStringSearchingTests {
    private StringSearchingInterface stringSearcher;

    @Before
    public void setup() {
        stringSearcher = new StringSearching();
    }

    // BoyerMoore
    @Test(timeout = 200)
    public void testBuildingTable1Comparisons() {
        SearchableString sampleString = new SearchableString("The quick brown");
        stringSearcher.buildLastTable(sampleString);
        assertEquals(sampleString.length(), sampleString.getCount());
    }

    @Test(timeout = 200)
    public void testBuildingTable1() {
        SearchableString sampleString = new SearchableString("The quick brown");
        int[] boyerTable = stringSearcher.buildLastTable(sampleString);
        assertEquals(Character.MAX_VALUE + 1, boyerTable.length);
        for (int i = 0; i < boyerTable.length; i++) {
            switch (i) {
            case 'T':
                assertEquals(0, boyerTable[i]);
                break;
            case 'h':
                assertEquals(1, boyerTable[i]);
                break;
            case 'e':
                assertEquals(2, boyerTable[i]);
                break;
            case ' ':
                assertEquals("Duplicates not handled correctly", 9,
                        boyerTable[i]);
                break;
            case 'q':
                assertEquals(4, boyerTable[i]);
                break;
            case 'u':
                assertEquals(5, boyerTable[i]);
                break;
            case 'i':
                assertEquals(6, boyerTable[i]);
                break;
            case 'c':
                assertEquals(7, boyerTable[i]);
                break;
            case 'k':
                assertEquals(8, boyerTable[i]);
                break;
            case 'b':
                assertEquals(10, boyerTable[i]);
                break;
            case 'r':
                assertEquals(11, boyerTable[i]);
                break;
            case 'o':
                assertEquals(12, boyerTable[i]);
                break;
            case 'w':
                assertEquals(13, boyerTable[i]);
                break;
            case 'n':
                assertEquals(14, boyerTable[i]);
                break;
            default:
                assertEquals("Default case is not correct", -1, boyerTable[i]);
                break;
            }
        }
    }

    @Test(timeout = 200)
    public void testBoyerMoore1() {
        SearchableString text = new SearchableString(
                "The quick brown fox jumps" + " over the lazy dog");
        SearchableString pattern = new SearchableString("own fox");
        List<Integer> matches = stringSearcher.boyerMoore(pattern, text);
        assertEquals("Incorrect number of matches found", 1, matches.size());
        assertEquals("Incorrect index for match", new Integer(12),
                matches.get(0));
        assertEquals(13, text.getCount());
        assertEquals(7 + 13, pattern.getCount());
    }

    @Test(timeout = 200)
    public void testBoyerMoore2() {
        SearchableString text = new SearchableString(
                "The quick brown fox jumps" + " over the lazy dog");
        SearchableString pattern = new SearchableString("green");
        List<Integer> matches = stringSearcher.boyerMoore(pattern, text);
        assertEquals("False matches found", 0, matches.size());
        assertEquals(11, text.getCount());
        assertEquals(5 + 11, pattern.getCount());
    }

    // Rabin-Karp Tests
    @Test(timeout = 100)
    public void generateHashTestBasic() {
        SearchableString string = new SearchableString("bunnbunn");
        assertEquals(1523991782,
                stringSearcher.generateHash(string, string.length()));
    }

    @Test(timeout = 100)
    public void updateHashTestBasic() {
        String str = "bunn";
        int oldHash = -612042413;
        int length = str.length();
        char oldChar = str.charAt(0);
        char newChar = 'y';
        assertEquals(929117178,
                stringSearcher.updateHash(oldHash, length, oldChar, newChar));
    }

    // helper method
    private List<Integer> integersToList(Integer... values) {
        return Arrays.asList(values);
    }

    @Test(timeout = 200)
    public void rabinCarpBasicTest() {
        SearchableString pattern = new SearchableString("test");
        SearchableString text = new SearchableString(
                "testatestfbteestasdntest");
        List<Integer> expected = integersToList(0, 5, 20);
        assertEquals(expected, stringSearcher.rabinKarp(pattern, text));
    }

    // Efficiency Tests
    @Test(timeout = 200)
    public void rabinCarpEfficiencyTest() {
        SearchableString pattern = new SearchableString("!!!!!!");
        SearchableString text = new SearchableString(
                "Lorem Ipsum is simply dummy text of the printing and "
                        + "typesetting industry. Lorem Ipsum has been "
                        + "the industry's"
                        + " standard dummy text ever since the 1500s, "
                        + "when an unknown"
                        + " printer took a galley of type and scramb"
                        + "led it to make a"
                        + " type specimen book. It has survived not on"
                        + "ly five centuries,"
                        + " but also the leap into electronic typesett"
                        + "ing, remaining"
                        + " essentially unchanged. It was popularised "
                        + "in the 1960s "
                        + "with the release of Letraset sheets conta"
                        + "ining Lorem Ipsum "
                        + "passages, and more recently with desktop "
                        + "publishing software"
                        + " like Aldus PageMaker including versions of "
                        + "Lorem Ipsum.");
        List<Integer> actual = stringSearcher.rabinKarp(pattern, text);

        System.out.println(text.getCount());
        assertTrue(text.getCount() <= text.length() * 2 + 10);
        assertTrue(pattern.getCount() <= pattern.length());
    }

    @Test(timeout = 200)
    public void generateHashEfficiencyTest() {
        SearchableString pattern = new SearchableString("!!!!!!");
        int actual = stringSearcher.generateHash(pattern, pattern.length());
        assertTrue(pattern.getCount() == pattern.length());
    }

    private String loremIpsum = "Lorem ipsum dolor sit amet, consectetur "
            + "adipiscing elit,"
            + " sed do eiusmod tempor incididunt ut labore et dolore magna "
            + "aliqua. Ut enim"
            + " ad minim veniam, quis nostrud exercitation ullamco laboris "
            + "nisi ut aliquip "
            + "ex ea commodo consequat. Duis aute irure dolor in "
            + "reprehenderit in voluptate "
            + "velit esse cillum dolore eu fugiat nulla pariatur. Excepteur "
            + "sint occaecat "
            + "cupidatat non proident, sunt in culpa qui officia deserunt "
            + "mollit anim id "
            + "est laborum.";

    /*-------------TEST ALL ILLEGAL ARGS-------------*/
    /*
     * BOYER MOORE If the pattern is null or of length 0, throw an
     * IllegalArgumentException. If the text is null, throw an
     * IllegalArgumentException. If the text is of length 0, return an empty
     * list.
     */
    @Test(expected = IllegalArgumentException.class, timeout = 200)
    public void testBoyerMooreIllegalArgs() {
        stringSearcher.boyerMoore(null, "blahblah");
    }

    @Test(expected = IllegalArgumentException.class, timeout = 200)
    public void testBoyerMooreIllegalArgs2() {
        stringSearcher.boyerMoore("", "blahblah");
    }

    @Test(expected = IllegalArgumentException.class, timeout = 200)
    public void testBoyerMooreIllegalArgs3() {
        stringSearcher.boyerMoore("blahblah", null);
    }

    /*
     * BUILD LAST TABLE If pattern is null throw an IllegalArgumentException
     */
    @Test(expected = IllegalArgumentException.class, timeout = 200)
    public void testBuildLastTableIllegalArgs() {
        stringSearcher.buildLastTable(null);
    }

    /*
     * GENERATE HASH If current is null throw an IllegalArgumentException. If
     * length is negative or greater than the length of current, throw an
     * IllegalArgumentException.
     */
    @Test(expected = IllegalArgumentException.class, timeout = 200)
    public void testGenerateHashIllegalArgs() {
        stringSearcher.generateHash(null, Integer.MAX_VALUE);
    }

    @Test(expected = IllegalArgumentException.class, timeout = 200)
    public void testGenerateHashIllegalArgs2() {
        stringSearcher.generateHash("sdfsdf", -32432);
    }

    @Test(expected = IllegalArgumentException.class, timeout = 200)
    public void testGenerateHashIllegalArgs3() {
        stringSearcher.generateHash("sdfsdf", 7);
    }

    /*
     * RABIN KARP If the pattern is null or of length 0, throw an
     * IllegalArgumentException. If the text is null, throw an
     * IllegalArgumentException. If the text is of length 0, return an empty
     * list.
     */
    @Test(expected = IllegalArgumentException.class, timeout = 200)
    public void testRabinKarpIllegalArgs() {
        stringSearcher.rabinKarp(null, "sdf");
    }

    @Test(expected = IllegalArgumentException.class, timeout = 200)
    public void testRabinKarpIllegalArgs2() {
        stringSearcher.rabinKarp("", "sdf");
    }

    @Test(expected = IllegalArgumentException.class, timeout = 200)
    public void testRabinKarpIllegalArgs3() {
        stringSearcher.rabinKarp("fdgfd", null);
    }

    /*-------------Begin other tests-------------*/

    /* If the text is of length 0, return an empty list. */
    @Test(timeout = 200)
    public void testBoyerMooreLenZero() {
        List<Integer> betterBeEmpty = stringSearcher.boyerMoore("DFSGsdfg", "");
        assertEquals("Should return list of length 0", 0, betterBeEmpty.size());
    }

    /*
     * If pattern is longer than text return list of length zero; see piazza
     * @949
     */
    @Test(timeout = 200)
    public void testBoyerMooreLenZero2() {
        List<Integer> betterBeEmpty = stringSearcher
                .boyerMoore("DFSGsdfg", "5");
        assertEquals("Should return list of length 0", 0, betterBeEmpty.size());
    }

    @Test(timeout = 200)
    public void testBoyerMooreLenOne() {
        List<Integer> betterNotBeEmpty = stringSearcher.boyerMoore("a",
                "aaaaaaaaaa");
        assertEquals("Should be the same length as text", 10,
                betterNotBeEmpty.size());
    }

    @Test(timeout = 200)
    public void testBoyerMooreLenOne2() {
        List<Integer> betterBeEmpty = stringSearcher.boyerMoore("a",
                "zzzzzzzzzzzzz");
        assertEquals("Should be empty since it does not appear in text", 0,
                betterBeEmpty.size());
    }

    @Test(timeout = 200)
    public void testBoyerMooreOverlapping() {
        List<Integer> betterNotBeEmpty = stringSearcher.boyerMoore("aa",
                "aaaaa");
        assertEquals("Does not work with patterns that overlap", 4,
                betterNotBeEmpty.size());
    }

    @Test(timeout = 200)
    public void testBoyerMooreOther() {
        Integer[] blah = {9, 299, 442};
        List<Integer> expected = new ArrayList<>();
        for (Integer i : blah) {
            expected.add(i);
        }
        List<Integer> betterNotBeEmpty = stringSearcher.boyerMoore("um",
                loremIpsum);
        assertEquals("Does not work with larger string?", expected,
                betterNotBeEmpty);
    }

    // now for Rabin Karp
    /* If the text is of length 0, return an empty list. */
    @Test(timeout = 200)
    public void testRapinKarpLenZero() {
        List<Integer> betterBeEmpty = stringSearcher.rabinKarp("DFSGsdfg", "");
        assertEquals("Should return list of length 0", 0, betterBeEmpty.size());
    }

    /*
     * If pattern is longer than text return list of length zero; see piazza
     * @949
     */
    @Test(timeout = 200)
    public void testRapinKarpLenZero2() {
        List<Integer> betterBeEmpty = stringSearcher.rabinKarp("DFSGsdfg", "2");
        assertEquals("Should return list of length 0", 0, betterBeEmpty.size());
    }

    @Test(timeout = 200)
    public void testRabinKarpLenOne() {
        List<Integer> betterNotBeEmpty = stringSearcher.rabinKarp("a",
                "aaaaaaaaaa");
        assertEquals("Should be the same length as text", 10,
                betterNotBeEmpty.size());
    }

    @Test(timeout = 200)
    public void testRabinKarpLenOne2() {
        List<Integer> betterBeEmpty = stringSearcher.rabinKarp("a",
                "zzzzzzzzzzzzz");
        assertEquals("Should be empty since it does not appear in text", 0,
                betterBeEmpty.size());
    }

    @Test(timeout = 200)
    public void testRabinKarpOverlapping() {
        List<Integer> betterNotBeEmpty = stringSearcher
                .rabinKarp("aa", "aaaaa");
        assertEquals("Does not work with patterns that overlap", 4,
                betterNotBeEmpty.size());
    }

    @Test(timeout = 200)
    public void testRabinKarpOther() {
        Integer[] blah = {9, 299, 442};
        List<Integer> expected = new ArrayList<>();
        for (Integer i : blah) {
            expected.add(i);
        }
        List<Integer> betterNotBeEmpty = stringSearcher.rabinKarp("um",
                loremIpsum);
        assertEquals("Does not work with larger string?", expected,
                betterNotBeEmpty);
    }
}
