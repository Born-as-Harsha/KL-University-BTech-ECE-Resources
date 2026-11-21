package My_Package;
import java.util.Scanner;
public class Count_number_of_digits {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int num = sc.nextInt();
        int count = 0;
        while (num > 0) {
            num /= 10;
            ++count;
        }
        System.out.print(count);
        sc.close();
    }
}