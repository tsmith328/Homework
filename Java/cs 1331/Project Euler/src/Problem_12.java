import java.util.Arrays;
import java.util.ArrayList;

public class Problem_12 {
    public static ArrayList<Long> factors(long num) {
        ArrayList<Long> list = new ArrayList<Long>();
        for (long i = 1; i < num; i++) {
            if (num%i == 0) {
                list.add(i);
            }
        }
        
        return list;
    }
    
    public static long makeTriangle(int number) {
        long tri = (number*(number+1))/2;
        return tri;
    }
    
    public static void main(String[] args) {
        for (int i = 0; i < 1000000; i++) {
            long triangle = makeTriangle(i);
            if (factors(triangle).size() > 500) {
                System.out.println(triangle);
            }
        }
    }
}
