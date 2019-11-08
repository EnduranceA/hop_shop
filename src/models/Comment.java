package models;

import java.sql.Timestamp;

public class Comment {

    private int id;
    private int customerId;
    private Timestamp time;
    private String text;

    public Comment(int id, int customerId, Timestamp time, String text) {
        this.id = id;
        this.customerId = customerId;
        this.time = time;
        this.text = text;
    }

    public Comment(int customerId, Timestamp time, String text) {
        this.customerId = customerId;
        this.time = time;
        this.text = text;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
