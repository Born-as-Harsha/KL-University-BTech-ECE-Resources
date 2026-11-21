package experiments.ex6;

import java.util.Scanner;

class InvalidAgeException extends Exception {
    private static final long serialVersionUID = 1L;

    InvalidAgeException(String message) {
        super(message);
    }
}

public class Inlab {

    public static void main(String[] args) {

        try (Scanner sc = new Scanner(System.in)) {

            System.out.print("Enter patient age: ");
            int age = sc.nextInt();

            try {
                if (age <= 0) {
                    throw new InvalidAgeException("Invalid Age");
                }

                System.out.println("Patient registration successful");

            } catch (InvalidAgeException e) {
                System.out.println(e.getMessage());
            }
        }
    }
}