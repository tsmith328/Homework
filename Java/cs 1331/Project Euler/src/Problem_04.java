
public class Problem_04 {
    public static boolean isPalindrome(int number) {
        String numStr = Integer.toString(number);
        int len = numStr.length();
        int i = 0;
        int j = len-1;
        while (i < j) {
            if ( numStr.charAt(i) != numStr.charAt(j) ) {
                return false;
            }
            i++;
            j--;
        }
        return true;
    }
    public static void main(String[] args) {

        int big = 0;
        for (int i = 100; i < 1000; i++){
            for (int j = 100; j < 1000; j++) {
                if (((i*j) > big) && isPalindrome(i*j)) {
                    big = i*j;
                    
                }
            }
        }
        System.out.println(big);
    }
}
