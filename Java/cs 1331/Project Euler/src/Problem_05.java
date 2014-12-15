
public class Problem_05 {
    public static boolean isDivis(int num) {
        boolean a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s;
        a = num%2==0;
        b = num%3==0;
        c = num%4==0;
        d = num%5==0;
        e = num%6==0;
        f = num%7==0;
        g = num%8==0;
        h = num%9==0;
        i = num%10==0;
        j = num%11==0;
        k = num%12==0;
        l = num%13==0;
        m = num%14==0;
        n = num%15==0;
        o = num%16==0;
        p = num%17==0;
        q = num%18==0;
        r = num%19==0;
        s = num%20==0;
        if(a&&b&&c&&d&&e&&f&&g&&h&&i&&j&&k&&l&&m&&n&&o&&p&&q&&r&&s) {
            return true;
        }
        return false;
    }
    public static void main(String[] args) {
        for (int i = 1; i < 1000000000; i++) {
            if(isDivis(i)) {
                System.out.println(i);
                return;
            }
        }
    }
}
