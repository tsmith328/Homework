
public class Problem_07 {
    public static void main(String[] args) {
        int counter = 0;
        int i = 1;
        while (true) {
            if(Problem_03.isPrime(i)) {
                counter ++;
            }
            if (counter == 10001) {
                System.out.println(i);
                return;
            }
            i++;
        }
    }
}
