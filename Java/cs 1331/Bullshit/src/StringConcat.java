import java.util.Date;

public class StringConcat {
    public static StringBuilder sb;
    public static Date d;
    public static long elapsed;
    public static void main(String[] args) {
        d = new Date();
        long start = d.getTime();
        sb = new StringBuilder();
        for (int i = 0; i < 1000000; i ++) {
            sb.append('d');
        }
        //System.out.println(sb);
        elapsed = d.getTime() - start;
        System.out.println(elapsed);
        start = d.getTime();
        String s = "";
        for (int j = 0; j < 1000000; j ++) {
            s += 'd';
        }
       // System.out.println(s);
        elapsed = d.getTime() - start;
        System.out.println(elapsed);
    }
}
