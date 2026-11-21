package My_Package;
import java.util.Scanner;
public class Factorial_number {
    public static int factorial(int x) {
        if (x == 0 || x == 1) {
            return 1;
        } else {
            return x * factorial(x - 1);
        }
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int x = sc.nextInt();
        int result = factorial(x);
        System.out.println("Factorial = " + result);
        sc.close();
    }
}