import java.io.*;
public class FileIO {
    public static void main(String[] args) {
        File dir = new File("C:/Users//Tyler");
        for (String s: dir.list()) {
            System.out.println(s);
        }
       // System.out.println(dir.list());
    }
}
