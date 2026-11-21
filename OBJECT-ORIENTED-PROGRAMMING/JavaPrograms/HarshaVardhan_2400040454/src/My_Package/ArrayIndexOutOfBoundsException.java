package My_Package;

public class ArrayIndexOutOfBoundsException {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] number = {1,2,3,4,5,6};
		try {
			System.out.println("Element:" + number[7]);
		}
		catch(java.lang.ArrayIndexOutOfBoundsException e) {
			System.out.println("Exception catch invalid array");
		}
		finally {
			System.out.println("cleanup operation");
			System.out.println("Resource closed");
		}
		System.out.println("Program continue");

	}

}
