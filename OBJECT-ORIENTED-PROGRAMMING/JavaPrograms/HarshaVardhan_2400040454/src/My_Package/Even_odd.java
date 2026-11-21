package My_Package;
import java.util.Scanner;

public class Even_odd {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner a = new Scanner(System.in);
		System.out.print("Enter a number:");
		int num = a.nextInt();
		if (num % 2 == 0) {
			System.out.println("Evennumber: " + num);
		}
		else {
			System.out.println("Oddnumber: " + num);
		}
		a.close();
	}

}
