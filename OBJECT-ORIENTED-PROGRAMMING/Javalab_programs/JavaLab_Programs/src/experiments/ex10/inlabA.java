package experiments.ex10;

import java.util.*;

public class inlabA {

    public static void main(String[] args) {

        // 1. Print Numbers using Lambda Expression
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);

        System.out.println("Numbers:");
        numbers.forEach(n -> System.out.println(n));

        // 2. Filter Even Numbers using Stream API
        System.out.println("Even Numbers:");
        numbers.stream()
               .filter(n -> n % 2 == 0)
               .forEach(n -> System.out.println(n));
    }
}