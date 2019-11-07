package models;

import java.sql.Timestamp;

public class Product {

    private int id;
    private String name;
    private String description;
    private int price;
    private int count;
    private String pathPhoto;
    private Timestamp time;
    private String size;
    private String color;
    private String format;

    public Product(int id, String name, String description, int price,
                   int count, String pathPhoto, String time, String size, String color, String format) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.count = count;
        this.pathPhoto = pathPhoto;
        this.time = new Timestamp(System.currentTimeMillis());
        this.size = size;
        this.color = color;
        this.format = format;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getPathPhoto() {
        return pathPhoto;
    }

    public void setPathPhoto(String pathPhoto) { this.pathPhoto = pathPhoto; }

    public Timestamp getTime() { return time; }

    public void setTime(Timestamp time) { this.time = time; }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }
}
