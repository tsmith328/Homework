
public class TestStack {
    public static void main(String[] args) {
        MyStack<Double> m = new MyStack<Double>();
        for (int i = 0; i < 10000; i++) {
            m.push(Math.random());
        }
        Double s;
        boolean cont = true;
        while (cont) {
            try {
                s = m.pop();
                System.out.println(s);
            } catch (EmptyMyStackException e) {
               // System.out.println(e.getMessage());
                e.printStackTrace();
                cont = false;
            }
        }
    }
}
