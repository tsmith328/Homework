import java.util.List;
import java.util.Map;

/**
 * Graph Search Recitation 13 Remember - if you ask a question on Piazza, make
 * sure it's private!
 *
 * Also, you do not have to run CheckStyle on this assignment. But make it look
 * pretty. Pretty please. With a cherry on top.
 *
 * If you don't know what to return for something, look at the JUnits. They
 * should tell you what they expect if null is passed in, etc. If there's not a
 * test case for it, then don't worry about it! :)
 *
 * @author Tyler Smith
 */
public class GraphSearch {

    /**
     * Searches the Graph passed in as an AdjcencyList(adjList) to find if a
     * path exists from the start node to the goal node using General Graph
     * Search.
     *
     * Assume the AdjacencyList contains adjacent nodes of each node in the
     * order they should be added to the Structure.
     *
     * The structure(struct) passed in is an empty structure may behave as a
     * Stack or Queue and the correspondingly search function should execute
     * DFS(Stack) or BFS(Queue) on the graph.
     *
     * We've written the stack and queue for you. Your mission, should you
     * choose to accept it (and you should), is to finish the graph search
     * algorithm.
     *
     * @param start
     * @param struct
     * @param adjList
     * @param goal
     * @return true if path exists false otherwise
     */
    public static <T> boolean generalGraphSearch(T start, Structure<T> struct,
            Map<T, List<T>> adjList, T goal) {
        if (start == null || adjList == null
                || goal == null || struct == null) {
            throw new IllegalArgumentException();
        }
        java.util.Set<T> visited = new java.util.HashSet<T>();
        //Dumb case
        if (start == goal) {
            return true;
        }
        for (T data : adjList.get(start)) {
            if (data == goal) {
                return true;
            }
            struct.add(data);
            visited.add(data);
        }
        while (!struct.isEmpty()) {
            T newData = struct.remove();
            visited.add(newData);
            if (newData == goal) {
                return true;
            }
            for (T newDataNeighbor : adjList.get(newData)) {
                if (!visited.contains(newDataNeighbor)) {
                    struct.add(newDataNeighbor);
                }
            }
        }
        return false;
    }

    /**
     * Searches the Graph passed in as an AdjcencyList(adjList) to find if a
     * path exists from the start node to the goal node using Breadth First
     * Search.
     *
     * Assume the AdjacencyList contains adjacent nodes of each node in the
     * order they should be added to the Structure.
     *
     * @param start
     * @param adjList
     * @param goal
     * @return true if path exists, false otherwise
     */
    public static <T> boolean breadthFirstSearch(T start,
            Map<T, List<T>> adjList, T goal) {
        return generalGraphSearch(start, new StructureQueue<T>(),
                adjList, goal);
        // Hint: This can be accomplished in one line.
    }

    /**
     * Searches the Graph passed in as an AdjcencyList(adjList) to find if a
     * path exists from the start node to the goal node using Depth First
     * Search.
     *
     * Assume the AdjacencyList contains adjacent nodes of each node in the
     * order they should be added to the Structure.
     *
     * @param start
     * @param adjList
     * @param goal
     * @return true if path exists, false otherwise
     */
    public static <T> boolean depthFirstSearch(T start,
            Map<T, List<T>> adjList, T goal) {
        return generalGraphSearch(start, new StructureStack<T>(),
                adjList, goal);
        // Hint: This can be accomplished in one line.
    }

} // There's only one more recitation left! :)
