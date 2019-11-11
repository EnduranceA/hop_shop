package models;

import java.sql.Timestamp;

public class Comment {

    private int id;
    private int customerId;
    private int productId;
    private Timestamp time;
    private String text;

    public Comment(int id, int customerId, int productId, Timestamp time, String text) {
        this.id = id;
        this.customerId = customerId;
        this.productId = productId;
        this.time = time;
        this.time = new Timestamp(System.currentTimeMillis());
        this.text = text;
    }

    public Comment(int customerId, int productId, Timestamp time, String text) {
        this.customerId = customerId;
        this.productId = productId;
        this.time = time;
        this.time = new Timestamp(System.currentTimeMillis());
        this.text = text;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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
