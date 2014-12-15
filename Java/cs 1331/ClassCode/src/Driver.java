public class Driver {
    public static void main(String[] args) {
        Animal[] a = new Animal[3];
        a[0] = new Bird();
        a[1] = new Fish();
        a[2] = new Dog();
        
        for (Animal animal: a) {
            if (animal instanceof Dog) {
                ((Dog) animal).bark();
                //or
                //Dog d = (Dog) animal;
                //d.bark();
            }
            animal.makeNoise();   
        }
        
//      for (int i = 0; i < a.length; i++) {
//          a[i].makeNoise();
//      }
    }
}

//import java.util.Scanner;
//Animal a;
//Scanner scan = new Scanner(System.in);
//int i = scan.nextInt();
//if( i == 0 ) {
//    a = new Fish();
//} else {
//    a = new Bird();
//}
//a.makeNoise(); 
//
//