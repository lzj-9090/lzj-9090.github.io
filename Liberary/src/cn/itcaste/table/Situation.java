package cn.itcaste.table;

public class Situation {
    private String email;
    private String bookName;
    private int subscribe;

    public Situation(String email, String bookName, int subscribe) {
        this.email = email;
        this.bookName = bookName;
        this.subscribe = subscribe;
    }

    public Situation() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getSubscribe() {
        return subscribe;
    }

    public void setSubscribe(int subscribe) {
        this.subscribe = subscribe;
    }
}
