package experiments.ex5;

class Account {

    void showAccount() {
        System.out.println("Bank Account");
    }
}
class savings extends Account {
    void showsavings() {
        System.out.println("Saving Account");
    }
}
class current extends Account {
    void showcurrent() {
        System.out.println("Current Account");
    }
}
interface bank {
    void interest();
}
class SBI implements bank {
    public void interest() {
        System.out.println("SBI interest: 7%");
    }
}
class HDFC implements bank {
    public void interest() {
        System.out.println("HDFC interest: 8%");
    }
}
public class Inlab {
    public static void main(String[] args) {

        // Inheritance
        savings s = new savings();
        s.showAccount();
        s.showsavings();

        current c = new current();
        c.showAccount();
        c.showcurrent();

        // Interface
        SBI sbi = new SBI();
        sbi.interest();

        HDFC hdfc = new HDFC();
        hdfc.interest();
    }
}