package com.firstspring.classes;

import javax.persistence.*;
import java.sql.Date;
@Entity
@Table(name = "accounts")
public class Accounts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "first_name")
    private String first_name;
    @Column(name = "last_name")
    private String last_name;
    @Column(name = "birth_date")
    private Date birth_date;
    @Column(name = "iin_number")
    private String iin_number;

    @ManyToOne
    @JoinColumn(name = "currency_id")
    private Currencies currency_id;

    @Column(name = "amount")
    private Double amount;
    @Column(name = "created_date")
    private Date created_date;
    @Column(name = "is_blocked")
    private boolean is_blocked;

    public Accounts() {
    }

    public Accounts(String name, String first_name, String last_name, Date birth_date, String iin_number, Currencies currency_id, Double amount, Date created_date, boolean is_blocked) {
        this.name = name;
        this.first_name = first_name;
        this.last_name = last_name;
        this.birth_date = birth_date;
        this.iin_number = iin_number;
        this.currency_id = currency_id;
        this.amount = amount;
        this.created_date = created_date;
        this.is_blocked = is_blocked;
    }
    public Accounts(Long id,String name, String first_name, String last_name, Date birth_date, String iin_number, Currencies currency_id, Double amount, Date created_date, boolean is_blocked) {
        this.id = id;
        this.name = name;
        this.first_name = first_name;
        this.last_name = last_name;
        this.birth_date = birth_date;
        this.iin_number = iin_number;
        this.currency_id = currency_id;
        this.amount = amount;
        this.created_date = created_date;
        this.is_blocked = is_blocked;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public Date getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(Date birth_date) {
        this.birth_date = birth_date;
    }

    public String getIin_number() {
        return iin_number;
    }

    public void setIin_number(String iin_number) {
        this.iin_number = iin_number;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public Currencies getCurrency_id() {
        return currency_id;
    }

    public void setCurrency_id(Currencies currency_id) {
        this.currency_id = currency_id;
    }

    public boolean isIs_blocked() {
        return is_blocked;
    }

    public void setIs_blocked(boolean is_blocked) {
        this.is_blocked = is_blocked;
    }
}
