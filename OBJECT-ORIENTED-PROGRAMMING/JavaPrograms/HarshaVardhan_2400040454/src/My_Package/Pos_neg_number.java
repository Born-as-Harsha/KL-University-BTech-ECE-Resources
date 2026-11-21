package My_Package;

import java.util.Scanner;

public class Pos_neg_number {

    public static void main(String[] args) {

        Scanner a = new Scanner(System.in);

        System.out.print("Enter the number: ");
        int num = a.nextInt();

        if (num > 0) {
            System.out.println(num + " is a Positive Number");
        } 
        else if (num < 0) {
            System.out.println(num + " is a Negative Number");
        } 
        else {
            System.out.println("The number is Zero");
        }

        a.close();
    }
}