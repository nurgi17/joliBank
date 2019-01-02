package com.firstspring.classes;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "transaction_histories")
public class Transaction_Histories {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "manager_id")
    private Users manager_id;

    @ManyToOne
    @JoinColumn(name = "sender_account_id")
    private Accounts sender_account_id;

    @ManyToOne
    @JoinColumn(name = "receiver_account_id")
    private Accounts receiver_account_id;

    @ManyToOne
    @JoinColumn(name = "operation_id")
    private Operations operation_id;

    @ManyToOne
    @JoinColumn(name = "currency_id")
    private Currencies currency_id;

    @Column(name = "amount")
    private Double amount;
    @Column(name = "operation_time")
    private Timestamp operation_time;

    public Transaction_Histories() {
    }

    public Transaction_Histories(Users manager_id, Accounts sender_account_id, Accounts receiver_account_id, Operations operation_id, Currencies currency_id, Double amount, Timestamp operation_time) {
        this.manager_id = manager_id;
        this.sender_account_id = sender_account_id;
        this.receiver_account_id = receiver_account_id;
        this.operation_id = operation_id;
        this.currency_id = currency_id;
        this.amount = amount;
        this.operation_time = operation_time;
    }

    public Transaction_Histories(Long id, Users manager_id, Accounts sender_account_id, Accounts receiver_account_id, Operations operation_id, Currencies currency_id, Double amount, Timestamp operation_time) {
        this.id = id;
        this.manager_id = manager_id;
        this.sender_account_id = sender_account_id;
        this.receiver_account_id = receiver_account_id;
        this.operation_id = operation_id;
        this.currency_id = currency_id;
        this.amount = amount;
        this.operation_time = operation_time;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Users getManager_id() {
        return manager_id;
    }

    public void setManager_id(Users manager_id) {
        this.manager_id = manager_id;
    }

    public Accounts getSender_account_id() {
        return sender_account_id;
    }

    public void setSender_account_id(Accounts sender_account_id) {
        this.sender_account_id = sender_account_id;
    }

    public Accounts getReceiver_account_id() {
        return receiver_account_id;
    }

    public void setReceiver_account_id(Accounts receiver_account_id) {
        this.receiver_account_id = receiver_account_id;
    }

    public Operations getOperation_id() {
        return operation_id;
    }

    public void setOperation_id(Operations operation_id) {
        this.operation_id = operation_id;
    }

    public Currencies getCurrency_id() {
        return currency_id;
    }

    public void setCurrency_id(Currencies currency_id) {
        this.currency_id = currency_id;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Timestamp getOperation_time() {
        return operation_time;
    }

    public void setOperation_time(Timestamp operation_time) {
        this.operation_time = operation_time;
    }
}
