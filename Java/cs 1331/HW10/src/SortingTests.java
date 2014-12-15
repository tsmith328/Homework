import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;


public class SortingTests {
    public static void main(String[] args) {
        /*String[]*/Integer[] ints = new /*String*/Integer[10000];
        /*String[]*/Integer[] ints2 = new /*String*/Integer[10000];
        /*String[]*/Integer[] ints3 = new /*String*/Integer[10000];
        /*String[]*/Integer[] ints4 = new /*String*/Integer[10000];
        Random r = new Random();
        for (int j = 0; j < ints.length; j++) {
            ints[j] = r.nextInt(100000);
            ints2[j] = r.nextInt(100000);
            ints3[j] = r.nextInt(100000);
            ints4[j] = r.nextInt(100000);
//          ints[j] = String.format("%d", j);
//          ints2[j] = String.format("%d", j);
//          ints3[j] = String.format("%d", j);
//          ints4[j] = String.format("%d", j);
        }
        AbstractSorter bs = new BubbleSorter(ints);
        AbstractSorter ss = new SelectionSorter(ints2);
        AbstractSorter iS = new InsertionSorter(ints3);
        AbstractSorter ms = new MergeSorter(ints4);
        bs.sortArray();
        ss.sortArray();
        iS.sortArray();
        ms.sortArray();
        Comparable[] sorted = bs.getArray();
        Comparable[] sorted2 = ss.getArray();
        Comparable[] sorted3 = iS.getArray();
        Comparable[] sorted4 = ms.getArray();
        String b = "Bubble:\n";
        for (Comparable me: sorted) {
            b += me + "\n";
        }
        System.out.println(writeToFile("bubble", b));

        String s = "Selection:\n";
        for (Comparable me: sorted2) {
            s += me + "\n";
        }
        System.out.println(writeToFile("selection", s));

        String i = "Insertion:\n";
        for (Comparable me: sorted3) {
            i += me + "\n";
        }
        System.out.println(writeToFile("insertion", i));

        String m = "Merge:\n";
        for (Comparable me: sorted4) {
            m += me + "\n";
        }
        System.out.println(writeToFile("merge", m));
    }

    private static String writeToFile(String sorter, String stuff) {
        try {

            File file = new File(sorter + ".txt");

            // if file doesnt exists, then create it
            if (!file.exists()) {
                file.createNewFile();
            }

            FileWriter fw = new FileWriter(file.getAbsoluteFile());
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(stuff);
            bw.close();

            return "Done";

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}