public class Problem_10 {
    public static void main(String[] args) {
        long sum = 0;
        long i = 0;
        while(i <= 2000000) {
            if(Problem_03.isPrime(i)) {
                sum = sum + i;
               
            } 
            //System.out.println(i+"\t|"+Problem_03.isPrime(i));
            i ++;
        }
        System.out.println(sum);
    }
}
