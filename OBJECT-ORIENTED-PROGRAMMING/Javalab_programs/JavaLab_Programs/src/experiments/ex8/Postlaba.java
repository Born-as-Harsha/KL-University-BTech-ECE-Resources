
package experiments.ex8;

import java.util.TreeSet;
import java.util.HashMap;

public class Postlaba {
    public static void main(String[] args) {

        TreeSet<String> books = new TreeSet<>();
        HashMap<Integer, String> library = new HashMap<>();

        books.add("Java");
        books.add("Python");
        books.add("C Programming");

        library.put(101, "Java");
        library.put(102, "Python");
        library.put(103, "C Programming");

        System.out.println("Books in Sorted Order:");
        for (String book : books) {
            System.out.println(book);
        }

        System.out.println("\nLibrary Book Details:");
        for (Integer id : library.keySet()) {
            System.out.println(id + " : " + library.get(id));
        }
    }
}
