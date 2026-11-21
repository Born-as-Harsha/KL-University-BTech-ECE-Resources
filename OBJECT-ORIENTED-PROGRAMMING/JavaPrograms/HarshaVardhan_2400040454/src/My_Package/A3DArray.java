package My_Package;

class A3DArray {

    public static void main(String[] args) {

        int my3Darray[][][] = new int[3][4][5];

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                for (int k = 0; k < 5; k++) {
                    my3Darray[i][j][k] = i * j * k;
                }
            }
        }

        for (int i = 0; i < 3; i++) {
            System.out.println("Layer " + i + ":");

            for (int j = 0; j < 4; j++) {
                for (int k = 0; k < 5; k++) {
                    System.out.print(my3Darray[i][j][k] + " ");
                }
                System.out.println();
            }

            System.out.println();
        }
    }
}