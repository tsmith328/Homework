public class Problem_09 {
    public static void main(String[] args) {
        int a,b,c;
        for(a = 1; a < 1000; a++) {
            for (b = 1; b< 1000; b++) {
                for (c = 1; c<1000; c++) {
                    int a_2 = a*a;
                    int b_2 = b*b;
                    int c_2 = c*c;
                    if (a_2 + b_2 == c_2) {
                        if (a + b + c == 1000) {
                            int ans = a*b*c;
                            System.out.println(ans);
                            return;
                        }
                    }
                }
            }
        }
    }
}
