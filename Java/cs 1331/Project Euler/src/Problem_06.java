
public class Problem_06 {
    final static int num = 100;
    public static int sumOfSqrs(int max) {
        int sum = 0;
        for (double i = 1; i <= max; i++) {
            sum = sum + (int)Math.pow(i,2);
        }
        return sum;
    }
    public static int sqrOfSum(int max) {
        int sum = 0;
        for (int i = 1; i <= max; i++) {
            sum = sum + i;
        }
        return ((int)Math.pow(sum, 2));
    }
    public static void main(String[] args) {
        System.out.println(Math.abs(sqrOfSum(num) - sumOfSqrs(num)));
    }
}
