import java.awt.Color;


public class Circle extends Shape {
    protected int x, y;
    protected int radius;
    
    public static void main(String[] ar) {
        Circle c = new Circle(1,2,3,Color.red);
        c.draw();
    }
    public Circle(int x, int y, int rad, Color color) {
        super(color);
        this.x = x;
        this.y = y;
        radius  = rad;
    }
    
    public void draw() {

    }
}
