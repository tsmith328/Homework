import java.awt.Color;


public abstract class Shape {
    protected Color col;
    
    public abstract void draw(); //abstract method
    
    public Color getColor() {
        return col;
    }
    public Shape(Color c) {
        col = c;
    }

}
