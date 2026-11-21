
package experiments.ex6;

import java.util.Scanner;

public class post_lab {

    static class InvalidAgeException extends Exception {
        private static final long serialVersionUID = 1L;

        InvalidAgeException(String message) {
            super(message);
        }
    }

    public static void main(String[] args) {

        try (Scanner sc = new Scanner(System.in)) {
            System.out.print("Enter Patient Name: ");
            String name = sc.nextLine();

            System.out.print("Enter Patient Age: ");
            int age = sc.nextInt();

            try {
                if (age <= 0) {
                    throw new InvalidAgeException("Invalid Patient Age");
                }

                System.out.println("Patient Registration Successful");
                System.out.println("Patient Name : " + name);
                System.out.println("Patient Age : " + age);
                System.out.println("Registration Process Completed.");

            } catch (InvalidAgeException e) {
                System.out.println(e.getMessage());
            }
        }
    }
}
