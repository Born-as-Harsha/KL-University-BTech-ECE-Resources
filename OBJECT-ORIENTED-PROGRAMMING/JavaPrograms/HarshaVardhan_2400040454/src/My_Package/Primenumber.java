package My_Package;

import java.util.Scanner;

public class Primenumber {

    public static void main(String[] args) {

        Scanner a = new Scanner(System.in);

        System.out.print("Enter number: ");
        int num = a.nextInt();

        boolean isPrime = true;

        if (num <= 1) {
            isPrime = false;
        } else {
            for (int i = 2; i < num; i++) {

                if (num % i == 0) {
                    isPrime = false;
                    break;
                }

            }
        }

        if (isPrime) {
            System.out.println(num + " is Prime");
        } else {
            System.out.println(num + " is Not Prime");
        }

        a.close();
    }
}