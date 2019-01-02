package com.firstspring.beans;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.persistence.criteria.*;
import java.util.List;
import com.firstspring.classes.*;
public class UserBean {
    private SessionFactory sessionFactory;
    public SessionFactory getSessionFactory() { return sessionFactory;
    }
    public void setSessionFactory(SessionFactory sessionFactory) { this.sessionFactory = sessionFactory;
    }

    //This functions take any type object and do save, update, delete commands, synchronize with database
    public void save(Object c1){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(c1);
        transaction.commit();
        session.close();
    }
    public void update(Object c1){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(c1);
        transaction.commit();
        session.close();
    }
    public void delete(Object c1){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(c1);
        transaction.commit();
        session.close();
    }
    //--------------------------------------------------------------------------------------------------

    //This methods get all data in certain Table from database
    public List<Users> getAllManagers() {
        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Users> query = criteriaBuilder.createQuery(Users.class);
        Root<Users> root = query.from(Users.class);
        List<Users> allUsers = session.createQuery(query).list();
        session.close();
        return allUsers;
    }
    public List<Currency_Exchange> getAllCurrencies(){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Currency_Exchange> criteriaQuery = builder.createQuery(Currency_Exchange.class);
        Root root = criteriaQuery.from(Currency_Exchange.class);
        List<Currency_Exchange> tasks = session.createQuery(criteriaQuery).list();
        session.close();
        return tasks;
    }
    public List<Bank_Total_Balance> getAllBalance(){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Bank_Total_Balance> criteriaQuery = builder.createQuery(Bank_Total_Balance.class);
        Root root = criteriaQuery.from(Bank_Total_Balance.class);
        List<Bank_Total_Balance> bank_total_balances = session.createQuery(criteriaQuery).list();
        session.close();
        return bank_total_balances;
    }

    public List<Transaction_Histories> getAllTransactions(){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Transaction_Histories> criteriaQuery = builder.createQuery(Transaction_Histories.class);
        Root root = criteriaQuery.from(Transaction_Histories.class);
        List<Transaction_Histories> transaction_histories = session.createQuery(criteriaQuery).list();
        session.close();
        return transaction_histories;
    }

    public List<Accounts> getAllAccounts(){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Accounts> criteriaQuery = builder.createQuery(Accounts.class);
        Root root = criteriaQuery.from(Accounts.class);
        List<Accounts> accounts = session.createQuery(criteriaQuery).list();
        session.close();
        return accounts;
    }
    //--------------------------------------------------------------------------------------------------

    //This methods take data from database by unique id
    public Currency_Exchange getCurrencyById(Long id){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Currency_Exchange> criteriaQuery = builder.createQuery(Currency_Exchange.class);
        Root root = criteriaQuery.from(Currency_Exchange.class);
        Predicate predicate = builder.equal(root.get("id"), id);
        List<Currency_Exchange> c1 = session.createQuery(criteriaQuery.where(predicate)).list();
        session.close();
        if(c1.size()!=0){
            return c1.get(0);
        }
        return null;
    }
    public Currencies getKZT(Long id){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Currencies> criteriaQuery = builder.createQuery(Currencies.class);
        Root root = criteriaQuery.from(Currencies.class);
        Predicate predicate = builder.equal(root.get("id"), id);
        List<Currencies> c1 = session.createQuery(criteriaQuery.where(predicate)).list();
        session.close();
        if(c1.size()!=0){
            return c1.get(0);
        }
        return null;
    }

    public Accounts getAccountByID(Long id){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Accounts> criteriaQuery = builder.createQuery(Accounts.class);
        Root root = criteriaQuery.from(Accounts.class);
        Predicate predicate = builder.equal(root.get("id"), id);
        List<Accounts> a1 = session.createQuery(criteriaQuery.where(predicate)).list();
        session.close();
        if(a1.size()!=0){
            return a1.get(0);
        }
        return null;
    }
    public Bank_Total_Balance getBalanceById(Long id){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Bank_Total_Balance> criteriaQuery = builder.createQuery(Bank_Total_Balance.class);
        Root root = criteriaQuery.from(Bank_Total_Balance.class);
        Predicate predicate = builder.equal(root.get("id"), id);
        List<Bank_Total_Balance> a1 = session.createQuery(criteriaQuery.where(predicate)).list();
        session.close();
        if(a1.size()!=0){
            return a1.get(0);
        }
        return null;
    }
    public List<Transaction_Histories> getTransactionByid(Long id){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Transaction_Histories> criteriaQuery = builder.createQuery(Transaction_Histories.class);
        Root root = criteriaQuery.from(Transaction_Histories.class);
        Predicate predicate = builder.equal(root.get("manager_id"), id);
        List<Transaction_Histories> a1 = session.createQuery(criteriaQuery.where(predicate)).list();
        session.close();
        if(a1.size()!=0){
            return a1;
        }
        return null;
    }
    //-----------------------------------------------------------------------------------------------------

    //This method take certain User from database by login and check it
    public Users getUser(String login) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Users> query = criteriaBuilder.createQuery(Users.class);
        Root<Users> root = query.from(Users.class);
        Users users = null;
        try {
             users = session.createQuery(query.where(criteriaBuilder.equal(root.get("login"), login))).getSingleResult();
             session.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }
}
