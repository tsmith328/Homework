public class Quiz {
        private int alpha=0;
        private static int beta=0;

        public void increment() {
          alpha++;
          beta++;
        }

        public void display() {
          System.out.println(alpha+" "+beta);
        }

        public static void main(String[] args){
          Quiz x = new Quiz();
          Quiz y = new Quiz();

          x.increment();
          y.increment();
          x.increment();

          x.display();        // printing happens here
          y.display();        // printing happens here

          x = y;
          x.increment();
             
          x.display();        // printing happens here
          y.display();        // printing happens here
        }
     }