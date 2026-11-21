package My_Package;

public class BankInterestCalculator {
    public static void main(String[] args) {
        int empId = 1000;
        int principalAmount = 10000;
        int time = 3;         
        float rateInterest = 10.0f;
        float interest = (principalAmount * rateInterest * time) / 100;
        float totalAmount = principalAmount + interest;
        System.out.println("Employee ID : " + empId);
        System.out.println("Principal Amount : " + principalAmount);
        System.out.println("Rate of Interest : " + rateInterest + "%");
        System.out.println("Time : " + time + " Years");
        System.out.println("Interest : " + interest);
        System.out.println("Total Amount : " + totalAmount);
    }

}