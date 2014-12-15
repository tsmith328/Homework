
public class Towers {
    public static String done = "";
    public static void towersOfHanoi(int numDiscs) {
        moveTower(numDiscs, 1, 3, 2);
    }
    
    public static void moveTower(int num, int start, int end, int temp) {
        if (num==0) {
            return;
        }
        moveTower(num-1, start, temp, end);
        moveOne(start, end);
        moveTower(num-1, temp, end, start);
    }
    public static void moveOne(int start, int end) {
        done += "Moving from "+start+" to "+ end+".";
    }
    public static void main(String[] args) {
        towersOfHanoi(40);
        System.out.println(done);
    }
}
