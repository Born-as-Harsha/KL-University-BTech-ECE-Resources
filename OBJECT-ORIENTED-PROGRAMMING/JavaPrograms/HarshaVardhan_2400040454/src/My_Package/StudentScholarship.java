package My_Package;

import java.util.Scanner;

public class StudentScholarship {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        // Student Details
        System.out.print("Enter Student ID: ");
        long studentId = sc.nextLong();   // Changed from int to long

        sc.nextLine(); // Clear buffer

        System.out.print("Enter Student Name: ");
        String studentName = sc.nextLine();

        System.out.print("Enter Department: ");
        String department = sc.nextLine();

        System.out.print("Enter Original Course Fee: ");
        double fee = sc.nextDouble();

        sc.nextLine(); // Clear buffer

        System.out.print("Enter Grade (O, A+, A, B+, B, C): ");
        String grade = sc.nextLine();

        double scholarship = 0;
        double finalFee = fee;

        // Scholarship Calculation
        if (grade.equalsIgnoreCase("O")) {

            scholarship = fee * 0.30;
            finalFee = fee - scholarship;

        }
        else if (grade.equalsIgnoreCase("A+")) {

            scholarship = fee * 0.25;
            finalFee = fee - scholarship;

        }
        else if (grade.equalsIgnoreCase("A")) {

            scholarship = fee * 0.20;
            finalFee = fee - scholarship;

        }
        else if (grade.equalsIgnoreCase("B+")) {

            scholarship = fee * 0.15;
            finalFee = fee - scholarship;

        }
        else if (grade.equalsIgnoreCase("B")) {

            scholarship = fee * 0.10;
            finalFee = fee - scholarship;

        }
        else if (grade.equalsIgnoreCase("C")) {

            scholarship = 0;
            finalFee = fee + 50000;

        }
        else {

            System.out.println("Invalid Grade!");
            sc.close();
            return;

        }

        // Display Student Details
        System.out.println("\n======================================");
        System.out.println("      STUDENT SCHOLARSHIP DETAILS");
        System.out.println("======================================");

        System.out.println("Student ID         : " + studentId);
        System.out.println("Student Name       : " + studentName);
        System.out.println("Department         : " + department);
        System.out.println("Original Fee       : ₹" + fee);
        System.out.println("Grade              : " + grade);
        System.out.println("Scholarship Amount : ₹" + scholarship);
        System.out.println("Final Fee to Pay   : ₹" + finalFee);

        System.out.println("======================================");

        sc.close();
    }
}