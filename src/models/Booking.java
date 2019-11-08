package models;


import java.sql.Timestamp;

public class Booking {
    private int id;
    private int idCustomer;
    private Timestamp time;
    private int amount;
    private int idStatus;
    private int idAddress;
    private String payment;
    private int idDelivery;

    public Booking(int id, int idCustomer, Timestamp time, int amount,
                   int idStatus, int idAddress, String payment, int idDelivery) {
        this.id = id;
        this.idCustomer = idCustomer;
        this.time = time;
        this.amount = amount;
        this.idStatus = idStatus;
        this.idAddress = idAddress;
        this.payment = payment;
        this.idDelivery = idDelivery;
    }

    public Booking(int idCustomer, int amount, int idStatus,
                   int idAddress, String payment, int idDelivery) {
        this.idCustomer = idCustomer;
        this.amount = amount;
        this.idStatus = idStatus;
        this.idAddress = idAddress;
        this.payment = payment;
        this.idDelivery = idDelivery;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(int idStatus) {
        this.idStatus = idStatus;
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public int getIdDelivery() {
        return idDelivery;
    }

    public void setIdDelivery(int idDelivery) {
        this.idDelivery = idDelivery;
    }
}
