package cn.itcaste.table;

import java.sql.Date;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String office="user";
    private int role=1;
    private Date birthday;

    public User(int id, String name, String email, String password, String office, int role, Date birthday) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.office = office;
        this.role = role;
        this.birthday = birthday;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}
