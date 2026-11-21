package My_Package;

import java.util.Calendar;

public class Legacy_data_1 {

    public static void main(String[] args) {

        Calendar cal = Calendar.getInstance();

        System.out.println("Year : " + cal.get(Calendar.YEAR));
        System.out.println("Month : " + (cal.get(Calendar.MONTH) + 1));
        System.out.println("Day : " + cal.get(Calendar.DATE));
    }

}