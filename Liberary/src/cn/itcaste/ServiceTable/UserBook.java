package cn.itcaste.ServiceTable;

import cn.itcaste.table.Book;
import cn.itcaste.table.Situation;

public class UserBook {
    private Book book;
    private Situation s1;

    public UserBook(Book book, Situation s1) {
        this.book = book;
        this.s1 = s1;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Situation getS1() {
        return s1;
    }

    public void setS1(Situation s1) {
        this.s1 = s1;
    }
}
