import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

public class MST {

    /**
     * Using disjoint set(s), run Kruskal's algorithm on the given graph and
     * return the MST. Return null if no MST exists for the graph.
     *
     * @param g The graph to be processed. Will never be null.
     * @return The MST of the graph; null if no valid MST exists.
     */
    public static Collection<Edge> kruskals(Graph g) {
        Collection<Edge> kruskal = new ArrayList<Edge>();
        Collection<Edge> edges = g.getEdgeList();
        Set<Vertex> vertices = g.getVertices();
        // TODO
        return null;
    }

    /**
     * Run Prim's algorithm on the given graph and return the minimum spanning
     * tree. If no MST exists, return null.
     *
     * @param g The graph to be processed. Will never be null.
     * @param start The ID of the start node. Will always exist in the graph.
     * @return the MST of the graph; null if no valid MST exists.
     */
    public static Collection<Edge> prims(Graph g, int start) {
        Collection<Edge> prim = new ArrayList<Edge>();
        Set<Vertex> vertices = g.getVertices();
        Collection<Edge> edges = g.getEdgeList();
        Vertex curr = MST.getActualVertex(vertices, start);
        //TODO I DONT KNOW WHAT IM DOING!!!
        return null;
    }

    /**
     * Returns the vertex in the graph which matches the id passed in.
     * @param vertices - A set of vertices in the graph
     * @param id - The ID of the vertex to find
     * @return the vertex object in the set which matches the ID, null
     *          it is not in the set.
     */
    private static Vertex getActualVertex(Set<Vertex> vertices, int id) {
        Vertex ret = null;
        Vertex test = new Vertex(id);
        for (Vertex v : vertices) {
            if (v.equals(test)) {
                ret = v;
            }
        }
        return ret;
    }
}
