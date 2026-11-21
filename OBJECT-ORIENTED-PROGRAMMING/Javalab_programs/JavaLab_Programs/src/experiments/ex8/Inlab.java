
package experiments.ex8;

import java.util.ArrayList;

public class Inlab {
    public static void main(String[] args) {
        ArrayList<String> names = new ArrayList<>();

        names.add("Harsha");
        names.add("Ravi");
        names.add("Sita");

        for (String name : names) {
            System.out.println(name);
        }
    }
}
