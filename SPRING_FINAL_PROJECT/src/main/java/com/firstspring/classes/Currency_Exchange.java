package com.firstspring.classes;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "currency_exchange")
public class Currency_Exchange {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @OneToOne
    @JoinColumn(name = "currency_id")
    private Currencies currency_id;

    @Column(name = "purchase_value")
    private Double purchase_value;
    @Column(name = "sale_value")
    private Double sale_value;
    @Column(name = "assigned_time")
    private Timestamp assigned_time;

    public Currency_Exchange() {
    }

    public Currency_Exchange(Currencies currency_id, Double purchase_value, Double sale_value, Timestamp assigned_time) {
        this.currency_id = currency_id;
        this.purchase_value = purchase_value;
        this.sale_value = sale_value;
        this.assigned_time = assigned_time;
    }

    public Currency_Exchange(Long id, Currencies currency_id, Double purchase_value, Double sale_value, Timestamp assigned_time) {
        this.id = id;
        this.currency_id = currency_id;
        this.purchase_value = purchase_value;
        this.sale_value = sale_value;
        this.assigned_time = assigned_time;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Currencies getCurrency_id() {
        return currency_id;
    }

    public void setCurrency_id(Currencies currency_id) {
        this.currency_id = currency_id;
    }

    public Double getPurchase_value() {
        return purchase_value;
    }

    public void setPurchase_value(Double purchase_value) {
        this.purchase_value = purchase_value;
    }

    public Double getSale_value() {
        return sale_value;
    }

    public void setSale_value(Double sale_value) {
        this.sale_value = sale_value;
    }

    public Timestamp getAssigned_time() {
        return assigned_time;
    }

    public void setAssigned_time(Timestamp assigned_time) {
        this.assigned_time = assigned_time;
    }

    @Override
    public String toString() {
        return "Currency_Exchange{" +
                " " + id +
                " " + currency_id +
                " " + purchase_value +
                " " + sale_value +
                " " + assigned_time;
    }
}
