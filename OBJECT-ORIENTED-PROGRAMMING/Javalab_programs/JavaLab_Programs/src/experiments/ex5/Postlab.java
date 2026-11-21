package experiments.ex5;

abstract class Shape {
    abstract void area();
}

class Circle extends Shape {
    void area() {
        System.out.println("Circle Area: " + (3.14 * 5 * 5));
    }
}

class Rectangle extends Shape {
    void area() {
        System.out.println("Rectangle Area: " + (10 * 5));
    }
}

interface PostBank {
    void interest();
}

class PostSBI implements PostBank {
    public void interest() {
        System.out.println("SBI Interest: 7%");
    }
}

class PostHDFC implements PostBank {
    public void interest() {
        System.out.println("HDFC Interest: 8%");
    }
}

public class Postlab {
    public static void main(String[] args) {

        Circle c = new Circle();
        c.area();

        Rectangle r = new Rectangle();
        r.area();

        PostSBI s = new PostSBI();
        s.interest();

        PostHDFC h = new PostHDFC();
        h.interest();
    }
}