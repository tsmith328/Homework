import java.util.Scanner;


public class FinalPractice {
    public static void main(String[] args) {
//        String s = "This string has two instances of the word string?!.";
//        String word = "string";
//        System.out.println(howOften(word,s));
//        int[][] d = question3(10,10);
//        for (int[] i: d) {
//            for (int j: i) {
//                System.out.print(j + ",");
//            }
//            System.out.println();
//        }
        
    }
    
    public static int[][] question3(int x, int y) {
        int[][] out = new int[x][y];
        for (int i = 0; i < x; i ++) {
            for (int j = 0; j < y; j ++) {
                out[i][j] = i*j;
            }
        }
        return out;
    }
    
    public static int howOften(String word, String sentence) {
        int count = 0;
        char ending;
        boolean done = false;
        while (!done) {
            ending = sentence.charAt(sentence.length() - 1);
            if (ending == '.' || ending == '?' || ending == '!') {
                sentence = sentence.substring(0,sentence.length() - 1);
            } else {done = true;}
        }
        Scanner s = new Scanner(sentence);
        while (s.hasNext()) {
            if ((s.next()).equals(word)) {
                count++;
            }
        }
        return count;
    }
}
