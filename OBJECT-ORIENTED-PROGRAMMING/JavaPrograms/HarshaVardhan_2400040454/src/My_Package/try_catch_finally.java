package My_Package;

public class try_catch_finally {

    public static void main(String[] args) {

        int[] number = {1, 2, 3};

        try {
            System.out.println(number[5]);
        }
        catch (java.lang.ArrayIndexOutOfBoundsException e) {
            System.out.println("Exception Caught");
        }
        finally {
            System.out.println("Finally block executed");
        }

        System.out.println("Page continue");
    }
}