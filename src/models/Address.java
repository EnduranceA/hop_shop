package models;

public class Address {
    private int id;
    private String area;
    private String region;
    private String locality;
    private String street;
    private int homeNumber;
    private int apartment;

    public Address(int id, String area, String region, String locality,
                   String street, int homeNumber, int apartment) {
        this.id = id;
        this.area = area;
        this.region = region;
        this.locality = locality;
        this.street = street;
        this.homeNumber = homeNumber;
        this.apartment = apartment;
    }

    public Address(String area, String region,
                   String locality, String street, int homeNumber, int apartment) {
        this.area = area;
        this.region = region;
        this.locality = locality;
        this.street = street;
        this.homeNumber = homeNumber;
        this.apartment = apartment;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getLocality() {
        return locality;
    }

    public void setLocality(String locality) {
        this.locality = locality;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public int getHomeNumber() {
        return homeNumber;
    }

    public void setHomeNumber(int homeNumber) {
        this.homeNumber = homeNumber;
    }

    public int getApartment() {
        return apartment;
    }

    public void setApartment(int apartment) {
        this.apartment = apartment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
