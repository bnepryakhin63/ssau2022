package com.example.domain;
import jakarta.persistence.*;
import java.io.Serializable;

@Entity(name="order")
@Table(name = "orders")
public class Order implements Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Zakaz")
    private String zakaz;

    @Column(name = "Count")
    private int count;

    @Column(name = "Price")
    private int price;

    @Column(name = "Id_user")
    private int id_user;

    public Order() {
    }

    public Order(String zakaz, int count, int price, int id_user) {
        this.zakaz = zakaz;
        this.count = count;
        this.price = price;
        this.id_user = id_user;
    }

    public int getId() {
        return id;
    }

    public void setID(int id) {
        this.id = id;
    }

    public String getZakaz() {
        return zakaz;
    }

    public void setZakaz(String zakaz) {
        this.zakaz = zakaz;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

}