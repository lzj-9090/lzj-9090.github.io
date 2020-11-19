package cn.itcaste.table;

public class Book {
    private int Id;
    private String bookName;
    private String bookType;
    private String bookAthor;
    private int number;
    private int price;
    private String introduce;

    public Book(int id, String bookName, String bookType, String bookAthor, int number, int price, String introduce) {
        Id = id;
        this.bookName = bookName;
        this.bookType = bookType;
        this.bookAthor = bookAthor;
        this.number = number;
        this.price = price;
        this.introduce = introduce;
    }

    public Book() {
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookType() {
        return bookType;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType;
    }

    public String getBookAthor() {
        return bookAthor;
    }

    public void setBookAthor(String bookAthor) {
        this.bookAthor = bookAthor;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
}
