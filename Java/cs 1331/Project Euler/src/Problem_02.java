import java.util.ArrayList;

public class Problem_02 {
    public static void main(String[] args) {
        ArrayList<Integer> fibb = new ArrayList<Integer>();
        int x = 1;
        int y = 1;
        int z = 2;
        fibb.add(x);
        fibb.add(y);
        fibb.add(z);
        int max = 4000000;
        while((fibb.get(fibb.size() - 1) < max)) {
            int length = fibb.size();
            fibb.add(fibb.get(length - 2) + fibb.get(length -1));
        }
        int i = 0;
        int l = fibb.size();
        int sum = 0;

        while (i < l) {
            if (fibb.get(i) % 2 == 0) {
                sum = sum + fibb.get(i);
            }
            i ++;
        }
        System.out.println(sum);
    }
}
