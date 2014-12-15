import java.util.Scanner;

/*
 *  Tyler M Smith
 *  CS 1331 Homework 3
 *  Section A2
 *  TAs: Andrea Fletcher and Ahmed Ismail
 */

public class CrazyCipher {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.println("Encode?");
        String encode = input.nextLine(); //Reads word to encode

        String output = String.valueOf(encode.charAt(0));

        //Shifts second letter forward by 4
        String second = String.valueOf((char) (encode.charAt(1) + 4));

        //Shifts third letter backward by 4
        String third = String.valueOf((char) (encode.charAt(2) + (-4)));

        //Swaps letters 4 and 5
        String fourth = String.valueOf(encode.charAt(4));
        String fifth = String.valueOf(encode.charAt(3));

        output = output + second + third + fourth + fifth;

        System.out.println("--> " + output);

        //Repeat above, but for word to decode
        //(Only difference is direction letters 2 and 3 move.)
        System.out.println("Decode?");
        String decode = input.nextLine();

        String output2 = String.valueOf(decode.charAt(0));

        char char2 = (char) (decode.charAt(1) + (-4));
        String second2 = String.valueOf(char2);
        String third2 = String.valueOf((char) (decode.charAt(2) + 4));
        String fourth2 = String.valueOf(decode.charAt(4));
        String fifth2 = String.valueOf(decode.charAt(3));

        output2 = output2 + second2 + third2 + fourth2 + fifth2;

        System.out.println("--> " + output2);
        input.close();
    }
}
