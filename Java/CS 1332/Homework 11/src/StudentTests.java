import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Collection;
import java.util.HashSet;

import org.junit.Test;

public class StudentTests {

    @Test(timeout = 500)
    public void basicDisjointTestSameSet() {
        HashSet<String> set = new HashSet<String>();
        set.add("a");
        set.add("b");
        set.add("c");
        set.add("d");
        DisjointSets<String> disjointSet = new DisjointSets<String>(set);
        assertTrue(disjointSet.sameSet("a", "a"));
        assertTrue(disjointSet.sameSet("b", "b"));
        assertTrue(disjointSet.sameSet("c", "c"));
        assertTrue(disjointSet.sameSet("d", "d"));
        assertFalse(disjointSet.sameSet("a", "b"));
        assertFalse(disjointSet.sameSet("a", "c"));
    }

    // Just a stress test
    @Test(timeout = 500)
    public void disjointTestSameSet() {
        HashSet<Integer> set = new HashSet<Integer>();
        java.util.Random r = new java.util.Random();
        for (int i = 0; i < Math.sqrt(Integer.MAX_VALUE); i++) {
            Integer num = r.nextInt();
            set.add(num);
            set.add(num * -1);
        }
        DisjointSets<Integer> disjointSet = new DisjointSets<Integer>(set);
        for (Integer i : set) {
            assertTrue(disjointSet.sameSet(i, new Integer(i)));
        }
    }

    @Test(timeout = 500)
    public void disjointMergeWithSimilarElements() {
        HashSet<String> set = new HashSet<String>();
        set.add("a");
        set.add("b");
        set.add("c");
        set.add("d");
        DisjointSets<String> disjointSet = new DisjointSets<String>(set);
        disjointSet.merge("a", "b");
        disjointSet.merge("a", "c");
        disjointSet.merge("c", "d");
        assertTrue(disjointSet.sameSet("a", "b"));
        assertTrue(disjointSet.sameSet("a", "c"));
        assertTrue(disjointSet.sameSet("a", "d"));
    }

    @Test(timeout = 500)
    public void linearKruskals() {
        Graph linearGraph = new Graph("4 1 2 1 2 3 1 3 4 1 4 5 1");
        int mstSize = 4;
        int mstTotalWeight = 4;
        int resultWeight = 0;
        Collection<Edge> resultMST = MST.kruskals(linearGraph);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        assertEquals(mstSize, resultMST.size());
        for (Edge e : resultMST) {
            resultWeight = resultWeight + e.getWeight();
        }
        assertEquals(mstTotalWeight, resultWeight);
    }

    @Test(timeout = 500)
    public void circularKruskals() {
        Graph circularGraph = new Graph("5 1 2 1 2 3 1 3 4 1 4 5 1 5 1 2");
        Graph linearGraph = new Graph("4 1 2 1 2 3 1 3 4 1 4 5 1");
        int mstSize = 4;
        int mstTotalWeight = 4;
        int resultWeight = 0;
        Collection<Edge> resultMST = MST.kruskals(circularGraph);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        assertEquals(mstSize, resultMST.size());
        for (Edge e : resultMST) {
            resultWeight = resultWeight + e.getWeight();
        }
        assertEquals(mstTotalWeight, resultWeight);
    }

    @Test(timeout = 500)
    public void linearPrims() {
        Graph linearGraph = new Graph("4 1 2 1 2 3 1 3 4 1 4 5 1");
        int mstSize = 4;
        int mstTotalWeight = 4;
        int resultWeight = 0;
        Collection<Edge> resultMST = MST.prims(linearGraph, 1);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(linearGraph, 2);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(linearGraph, 3);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(linearGraph, 4);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(linearGraph, 5);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        assertEquals(mstSize, resultMST.size());
        for (Edge e : resultMST) {
            resultWeight = resultWeight + e.getWeight();
        }
        assertEquals(mstTotalWeight, resultWeight);
    }

    @Test(timeout = 500)
    public void circularPrims() {
        Graph circularGraph = new Graph("5 1 2 1 2 3 1 3 4 1 4 5 1 5 1 2");
        Graph linearGraph = new Graph("4 1 2 1 2 3 1 3 4 1 4 5 1");
        int mstSize = 4;
        int mstTotalWeight = 4;
        int resultWeight = 0;
        Collection<Edge> resultMST = MST.prims(circularGraph, 1);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(circularGraph, 1);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(circularGraph, 2);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(circularGraph, 3);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(circularGraph, 4);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(circularGraph, 5);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        assertEquals(mstSize, resultMST.size());
        for (Edge e : resultMST) {
            resultWeight = resultWeight + e.getWeight();
        }
        assertEquals(mstTotalWeight, resultWeight);
    }

    /*----DISJOINT SET TESTS----*/

    // ----test error handling
    @Test(expected = IllegalArgumentException.class)
    public void testNullSameSetArg1() {
        DisjointSets<String> disjointSet = makeBasicDisjointSet();
        disjointSet.sameSet(null, "b");
    }

    @Test(expected = IllegalArgumentException.class)
    public void testNullSameSetArg2() {
        DisjointSets<String> disjointSet = makeBasicDisjointSet();
        disjointSet.sameSet("b", null);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testNullMergeArg1() {
        DisjointSets<String> disjointSet = makeBasicDisjointSet();
        disjointSet.merge(null, "b");
    }

    @Test(expected = IllegalArgumentException.class)
    public void testNullMergeArg2() {
        DisjointSets<String> disjointSet = makeBasicDisjointSet();
        disjointSet.merge("b", null);
    }

    // ----test each element in disjoint set is its own set
    @Test(timeout = 500)
    public void basicDisjointTestSameSet2() {
        DisjointSets<String> disjointSet = makeBasicDisjointSet();
        HashSet<String> backingSet = backingSetForBasicDisjointSet();

        for (String s : backingSet) {
            assertTrue(disjointSet.sameSet(s, s));
        }
    }

    @Test(timeout = 500)
    public void disjointMergeWithSimilarElements2() {
        HashSet<String> set = new HashSet<String>();
        set.add("a");
        set.add("b");
        set.add("c");
        set.add("d");
        DisjointSets<String> disjointSet = new DisjointSets<String>(set);
        disjointSet.merge("a", "b");
        disjointSet.merge("a", "c");
        disjointSet.merge("c", "d");
        assertTrue(disjointSet.sameSet("a", "b"));
        assertTrue(disjointSet.sameSet("a", "c"));
        assertTrue(disjointSet.sameSet("a", "d"));
    }

    // ----test merging everything and then checking if its all in the same set
    @Test(timeout = 200)
    public void disjointMergeTest1() {
        DisjointSets<Integer> disjointSet = makeLargeDisjointSet();

        for (int i = 0; i < 100; i++) {
            disjointSet.merge(0, i);
        }

        for (int i = 0; i < 100; i++) {
            for (int j = 0; j < 100; j++) {
                assertTrue(disjointSet.sameSet(i, j));
            }
        }
    }

    // ----test merging some of the sets but not all of them
    @Test(timeout = 200)
    public void disjointMergeTest2() {
        DisjointSets<String> disjointSet = makeBasicDisjointSet();
        HashSet<String> set1 = new HashSet<>();
        HashSet<String> set2 = new HashSet<>();
        set1.add("a");
        set1.add("b");
        set1.add("c");
        set2.add("d");
        set2.add("e");
        set2.add("f");

        // make set 1
        disjointSet.merge("a", "b");
        disjointSet.merge("b", "c");
        // make set 2
        disjointSet.merge("d", "e");
        disjointSet.merge("e", "f");

        // test a, b, c is the same set
        for (String s1 : set1) {
            for (String s2 : set1) {
                assertTrue(disjointSet.sameSet(s1, s2));
            }
        }

        // test d, e, f is the same set
        for (String s1 : set2) {
            for (String s2 : set2) {
                assertTrue(disjointSet.sameSet(s1, s2));
            }
        }

        // test none of set 1 is in set 2
        for (String s1 : set2) {
            for (String s2 : set1) {
                assertTrue(!disjointSet.sameSet(s1, s2));
            }
        }
    }

    // Test a graph that resembles a wheel
    @Test(timeout = 200)
    public void testCenterNodeGraphKruskals() {
        Graph graph = makeGraphWithManyNodesFromOne();
        int expectedWeight = 20;

        int resultWeight = 0;
        Collection<Edge> resultMST = MST.kruskals(graph);

        for (Edge e : resultMST) {
            resultWeight += e.getWeight();
        }

        assertTrue(resultMST.containsAll(graph.getEdgeList()));
        assertEquals(expectedWeight, resultWeight);
    }

    /*----KRUSKAL TESTS----*/
    @Test(timeout = 500)
    public void linearKruskals2() {
        Graph linearGraph = new Graph("4 1 2 1 2 3 1 3 4 1 4 5 1");
        int mstSize = 4;
        int mstTotalWeight = 4;
        int resultWeight = 0;
        Collection<Edge> resultMST = MST.kruskals(linearGraph);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        assertEquals(mstSize, resultMST.size());
        for (Edge e : resultMST) {
            resultWeight = resultWeight + e.getWeight();
        }
        assertEquals(mstTotalWeight, resultWeight);
    }

    @Test(timeout = 500)
    public void circularKruskals2() {
        Graph circularGraph = new Graph("5 1 2 1 2 3 1 3 4 1 4 5 1 5 1 2");
        Graph linearGraph = new Graph("4 1 2 1 2 3 1 3 4 1 4 5 1");
        int mstSize = 4;
        int mstTotalWeight = 4;
        int resultWeight = 0;
        Collection<Edge> resultMST = MST.kruskals(circularGraph);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        assertEquals(mstSize, resultMST.size());
        for (Edge e : resultMST) {
            resultWeight = resultWeight + e.getWeight();
        }
        assertEquals(mstTotalWeight, resultWeight);
    }

    // Test one center node with many nodes branching out from it
    @Test(timeout = 200)
    public void testWheelGraphKruskals() {

        Graph graph = makeWheelGraph();
        Graph minGraph = makeWheelGraphMST();
        int expectedWeight = 6;

        int resultWeight = 0;
        Collection<Edge> resultMST = MST.kruskals(graph);

        for (Edge e : resultMST) {
            resultWeight += e.getWeight();
        }

        assertTrue(resultMST.containsAll(minGraph.getEdgeList()));
        assertEquals(expectedWeight, resultWeight);
    }

    // Test a large a graph
    @Test(timeout = 200)
    public void testLargeGraphKruskals() {
        Graph graph = makeLargeGraph();
        Graph minGraph = makeLargeGraphMST();
        int expectedWeight = 16;

        int resultWeight = 0;
        Collection<Edge> resultMST = MST.kruskals(graph);

        for (Edge e : resultMST) {
            resultWeight += e.getWeight();
        }

        assertTrue(resultMST.containsAll(minGraph.getEdgeList()));
        assertEquals(expectedWeight, resultWeight);
    }

    /*----PRIMS TESTS----*/
    @Test(timeout = 200)
    public void simplePrims() {
        Graph graph = new Graph("5 0 1 11 0 2 2 0 3 0 0 4 4 0 5 1");
        int expectedWeight = 18;

        for (int i = 0; i < 6; i++) {
            int resultWeight = 0;
            Collection<Edge> resultMST = MST.prims(graph, i);

            for (Edge e : resultMST) {
                resultWeight += e.getWeight();
            }

            assertTrue(resultMST.containsAll(graph.getEdgeList()));
            assertEquals(expectedWeight, resultWeight);
        }
    }

    @Test(timeout = 500)
    public void linearPrims2() {
        Graph linearGraph = new Graph("4 1 2 1 2 3 1 3 4 1 4 5 1");
        int mstSize = 4;
        int mstTotalWeight = 4;
        int resultWeight = 0;
        Collection<Edge> resultMST = MST.prims(linearGraph, 1);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(linearGraph, 2);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(linearGraph, 3);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(linearGraph, 4);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        resultMST = MST.prims(linearGraph, 5);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));
        assertEquals(mstSize, resultMST.size());
        for (Edge e : resultMST) {
            resultWeight = resultWeight + e.getWeight();
        }
        assertEquals(mstTotalWeight, resultWeight);
    }

    @Test(timeout = 500)
    public void circularPrims2() {
        Graph circularGraph = new Graph("5 1 2 1 2 3 1 3 4 1 4 5 1 5 1 2");
        Graph linearGraph = new Graph("4 1 2 1 2 3 1 3 4 1 4 5 1");
        int mstSize = 4;
        int mstTotalWeight = 4;
        int resultWeight = 0;
        Collection<Edge> resultMST = MST.prims(circularGraph, 1);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));

        resultMST = MST.prims(circularGraph, 1);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));

        resultMST = MST.prims(circularGraph, 2);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));

        resultMST = MST.prims(circularGraph, 3);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));

        resultMST = MST.prims(circularGraph, 4);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));

        resultMST = MST.prims(circularGraph, 5);
        assertTrue(linearGraph.getEdgeList().containsAll(resultMST));

        assertEquals(mstSize, resultMST.size());

        for (Edge e : resultMST) {
            resultWeight = resultWeight + e.getWeight();
        }
        assertEquals(mstTotalWeight, resultWeight);
    }

    // Test a graph that resembles a wheel
    @Test(timeout = 200)
    public void testCenterNodeGraphPrims() {
        Graph graph = makeGraphWithManyNodesFromOne();
        int expectedWeight = 20;

        for (int i = 0; i < 6; i++) {
            int resultWeight = 0;
            Collection<Edge> resultMST = MST.prims(graph, i);

            for (Edge e : resultMST) {
                resultWeight += e.getWeight();
            }

            assertTrue(resultMST.containsAll(graph.getEdgeList()));
            assertEquals(expectedWeight, resultWeight);
        }
    }

    // Test a graph that resembles a wheel
    @Test(timeout = 200)
    public void testWheelGraphPrims() {

        Graph graph = makeWheelGraph();
        Graph minGraph = makeWheelGraphMST();
        int expectedWeight = 6;

        for (int i = 0; i < 4; i++) {
            int resultWeight = 0;
            Collection<Edge> resultMST = MST.prims(graph, i);

            for (Edge e : resultMST) {
                resultWeight += e.getWeight();
            }

            assertTrue(resultMST.containsAll(minGraph.getEdgeList()));
            assertEquals(expectedWeight, resultWeight);
        }
    }

    @Test(timeout = 200)
    public void testLargeGraphPrims() {
        Graph graph = makeLargeGraph();
        Graph minGraph = makeLargeGraphMST();
        int expectedWeight = 16;

        for (int i = 0; i < 6; i++) {
            int resultWeight = 0;
            Collection<Edge> resultMST = MST.prims(graph, i);

            for (Edge e : resultMST) {
                resultWeight += e.getWeight();
            }

            assertTrue(resultMST.containsAll(minGraph.getEdgeList()));
            assertEquals(expectedWeight, resultWeight);
        }
    }

    /*----HELPER METHODS----*/
    private DisjointSets<String> makeBasicDisjointSet() {
        return new DisjointSets<String>(backingSetForBasicDisjointSet());
    }

    private HashSet<String> backingSetForBasicDisjointSet() {
        HashSet<String> set = new HashSet<String>();
        set.add("a");
        set.add("b");
        set.add("c");
        set.add("d");
        set.add("e");
        set.add("f");
        return set;
    }

    private DisjointSets<Integer> makeLargeDisjointSet() {
        HashSet<Integer> set = new HashSet<Integer>();
        for (int i = 0; i < 100; i++) {
            set.add(new Integer(i));
        }
        return new DisjointSets<Integer>(set);
    }

    private Graph makeGraphWithManyNodesFromOne() {
        return new Graph("5 0 1 -1 0 2 2 0 3 0 0 4 4 0 5 15");
    }

    // big ol' graph
    private Graph makeLargeGraph() {
        return new Graph("11 1 3 3 1 0 7 1 4 2 1 2 13 2 0 6 0 3 5 3 4 "
                + "4 4 5 0 2 5 10 5 0 8 2 4 9");
    }

    private Graph makeLargeGraphMST() {
        return new Graph("5 2 0 6 0 3 5 1 3 3 1 4 2 4 5 0");
    }

    // a center node, a ring of outer nodes.
    // center node is connected to all outer nodes
    // all outer nodes are linearlly connected
    private Graph makeWheelGraph() {
        return new Graph("7 0 1 0 0 2 1 0 3 4 0 4 7 1 2 5 2 3 3 3 4 2");
    }

    private Graph makeWheelGraphMST() {
        return new Graph("4 0 1 0 0 2 1 2 3 3 3 4 2");
    }
}
