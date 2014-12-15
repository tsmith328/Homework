
public class Problem_01 {
    public static void main(String[] args) {
        int num = 0;
        int sum = 0;
        while (num < 1000) {
            if (((num % 3) == 0) || ((num % 5) == 0)) {
                sum = num + sum;
            }
            num ++;
        }
        System.out.println(sum);
    }
}
