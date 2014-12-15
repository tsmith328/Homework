import java.io.FileNotFoundException;
import java.io.PrintWriter;


public class FileTest {
    public static void main(String[] args) throws FileNotFoundException {
        PrintWriter p1 = new PrintWriter("a.txt");
        PrintWriter p2 = new PrintWriter("a.txt");
        p1.close();
        p2.close();
    }
}
