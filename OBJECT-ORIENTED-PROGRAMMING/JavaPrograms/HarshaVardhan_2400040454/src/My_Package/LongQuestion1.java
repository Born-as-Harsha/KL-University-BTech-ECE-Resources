package My_Package;

import java.util.Scanner;

public class LongQuestion1 {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        // Employee Details
        System.out.print("Enter Employee ID: ");
        int empId = sc.nextInt();

        sc.nextLine();   // Clear the newline

        System.out.print("Enter Employee Name: ");
        String empName = sc.nextLine();

        System.out.print("Enter Salary: ");
        double salary = sc.nextDouble();

        System.out.print("Enter Grade (A/B/C): ");
        char grade = sc.next().charAt(0);

        System.out.print("Is Employee Permanent (true/false): ");
        boolean permanent = sc.nextBoolean();

        // Salary Calculation
        double hra = salary * 0.20;
        double da = salary * 0.10;
        double grossSalary = salary + hra + da;

        // Type Casting
        int salaryInt = (int) salary;

        // Wrapper Boxing
        Integer boxedId = Integer.valueOf(empId);
        Double boxedSalary = Double.valueOf(salary);

        // Wrapper Unboxing
        int unboxedId = boxedId;
        double unboxedSalary = boxedSalary;

        // Employee Performance
        String performance;

        if (grade == 'A' || grade == 'a') {
            performance = "Excellent";
        } 
        else if (grade == 'B' || grade == 'b') {
            performance = "Good";
        } 
        else if (grade == 'C' || grade == 'c') {
            performance = "Average";
        } 
        else {
            performance = "Invalid Grade";
        }

        // Display Employee Details
        System.out.println("\n========== EMPLOYEE DETAILS ==========");

        System.out.println("Employee ID        : " + empId);
        System.out.println("Employee Name      : " + empName);
        System.out.println("Basic Salary       : " + salary);
        System.out.println("HRA (20%)          : " + hra);
        System.out.println("DA (10%)           : " + da);
        System.out.println("Gross Salary       : " + grossSalary);
        System.out.println("Grade              : " + grade);
        System.out.println("Performance        : " + performance);
        System.out.println("Permanent Employee : " + permanent);

        // Type Casting
        System.out.println("\n------ TYPE CASTING ------");
        System.out.println("Salary after Casting : " + salaryInt);

        // Wrapper Class
        System.out.println("\n------ WRAPPER CLASS ------");
        System.out.println("Boxed Employee ID   : " + boxedId);
        System.out.println("Boxed Salary        : " + boxedSalary);
        System.out.println("Unboxed Employee ID : " + unboxedId);
        System.out.println("Unboxed Salary      : " + unboxedSalary);

        sc.close();
    }
}