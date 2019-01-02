package com.firstspring.classes;

import javax.persistence.*;

@Entity
@Table(name = "bank_total_balance")
public class Bank_Total_Balance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "value")
    private Double value;

    @OneToOne
    @JoinColumn(name = "currency_id")
    private Currencies currency_id;

    public Bank_Total_Balance() {

    }

    public Bank_Total_Balance(Double value, Currencies currency_id) {
        this.value = value;
        this.currency_id = currency_id;
    }


    public Bank_Total_Balance(Long id,Double value, Currencies currency_id) {
        this.id = id;
        this.value = value;
        this.currency_id = currency_id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public Currencies getCurrency_id() {
        return currency_id;
    }

    public void setCurrency_id(Currencies currency_id) {
        this.currency_id = currency_id;
    }
}
