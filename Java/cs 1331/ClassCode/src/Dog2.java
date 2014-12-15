
public class Dog2 extends Animal2{
 public Dog2() {
     this("I is a dog");
 }
 public Dog2(String n) {
     super(n);
     System.out.println("Me be dog");
 }
 public void eat() {
     System.out.println("dog eat");
 }
}
