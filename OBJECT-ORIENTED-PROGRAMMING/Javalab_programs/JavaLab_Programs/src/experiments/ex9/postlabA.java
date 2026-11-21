package experiments.ex9;

import java.util.*;

class StudentPost implements Comparable<StudentPost> {
    int rank;
    String name;

    StudentPost(int rank, String name) {
        this.rank = rank;
        this.name = name;
    }

    public int compareTo(StudentPost s) {
        return this.rank - s.rank;
    }

    public String toString() {
        return rank + " " + name;
    }
}

class SortByRank implements Comparator<StudentPost> {
    public int compare(StudentPost s1, StudentPost s2) {
        return s1.rank - s2.rank;
    }
}

public class postlabA {
    public static void main(String[] args) {

        ArrayList<StudentPost> students = new ArrayList<>();

        students.add(new StudentPost(3, "Rahul"));
        students.add(new StudentPost(1, "Anil"));
        students.add(new StudentPost(2, "Kiran"));

        Collections.sort(students);

        System.out.println("Sorted using Comparable:");
        for (StudentPost s : students)
            System.out.println(s);

        Collections.sort(students, new SortByRank());

        System.out.println("Sorted using Comparator:");
        for (StudentPost s : students)
            System.out.println(s);
    }
}