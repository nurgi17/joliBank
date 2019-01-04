package com.firstspring.controllers;

import com.firstspring.beans.UserBean;
import com.firstspring.classes.*;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.*;
@Controller
public class FunctionalController {
    @Autowired
    UserBean userBean;

    //AJAX requests--------------------------------------------------------------------------------------------
    @RequestMapping(value = "/Change1", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8"})
    public @ResponseBody String adminChange1(@RequestParam Double sum,
                                             @RequestParam Long id1,
                                             @RequestParam Long id2){
        if(id1==id2){//If you select same currencies
            return "You can't exchange money between same currencies!!!";
        }

        Currency_Exchange c1 = userBean.getCurrencyById(id1);//get current currency_exchange value from database
        Currency_Exchange c2 = userBean.getCurrencyById(id2);

        if(id1==6||id1==7){//In database we don't have currency_exchange KZT
            c1=userBean.getCurrencyById(id1-1);//Order in database without KZT
        }//In this case we need take the last two currency_exchange value by minus 1
        if(id2==6||id2==7){
            c2=userBean.getCurrencyById(id2-1);
        }

        Currencies cc1 = userBean.getKZT(id1);//We need take KZT from currencies
        Currencies cc2 = userBean.getKZT(id2);

        double ex = exchange(c1, c2, sum, cc1, cc2);//Call method exchange which do exchange for us
        return ex+"";//after this return value
    }

    public Double exchange(Currency_Exchange c1, Currency_Exchange c2, Double sum, Currencies cc1,Currencies cc2){
        if(cc1.getId()==5){//If first value is KZT, second one is another currency
            return sum/c2.getSale_value();//We need only divide sum value to second currency sale_value
        }
        if(cc2.getId()==5){//If second value is KZT, the first one is another currency
            return c1.getPurchase_value()*sum;//We need only multiply sum value to the first purchase_value
        }
        //If both cases are not KZT
        //We need change first value to KZT after this KZT value divide to second sale_value
        return (c1.getPurchase_value()*sum)/c2.getSale_value();
    }

    @RequestMapping(value = "/Change2", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8"})
    public @ResponseBody String change2(@RequestParam Double total,
                                        @RequestParam Long id){
        //This method for debet
        Accounts account = userBean.getAccountByID(id);
        if(account.isIs_blocked()){
            return "Sorry but your account is blocked!!!";
        }
        if(total>100000){//We can put in account no more than 100000 value in one transaction
            return "You can add no more than 100000!!!";
        }
        //if manager doesn't out of range everything is ok
        return "Everything is ok!!!";
    }

    @RequestMapping(value = "/Change3", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8"})
    public @ResponseBody String change3(@RequestParam Double total,
                                        @RequestParam Long id){
        Accounts account = userBean.getAccountByID(id);//For visualize how many money this account have
        if(account.isIs_blocked()){
            return "Sorry but your account is blocked!!!";
        }
        if(account.getAmount()<total){//If amount which is written more than current amount from account
            return "Sorry but you don't have enough money!!!";//This message will be appear
        }
        //If everything is ok only amount from acoount will be appear
        return "You have: "+account.getAmount();//
    }

    @RequestMapping(value = "/Change4", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8"})
    public @ResponseBody String change4(@RequestParam Double total,
                                        @RequestParam Long id,
                                        @RequestParam Long id1){
        //This is transfer money between accounts which have different type of currency account

        if(id==id1){//If accounts are same you need use another type of operation like DEBET or CREDIT
            return "You need use another transaction type like DEBET or CREDIT!!!";
        }
        Accounts account1 = userBean.getAccountByID(id);//Get account by id from database
        Accounts account2 = userBean.getAccountByID(id1);
        if(account1.isIs_blocked()){
            return "Sorry but your account is blocked!!!";
        }
        if(account2.isIs_blocked()){
            return "Sorry but receiver account is blocked!!!";
        }
        //Get currency_exchange type from database
        Currency_Exchange c1 = userBean.getCurrencyById(account1.getCurrency_id().getId());
        Currency_Exchange c2 = userBean.getCurrencyById(account2.getCurrency_id().getId());

        //If accounts are different but currencies are same
        if(account1.getCurrency_id().getId()==account2.getCurrency_id().getId()&&id!=id1){
            if(account1.getAmount()<total){//Check out of range or not
                return "You don't have enough money!!!";
            }
            return "Everything is ok!!!";
        }

        //If accounts different and currencies also different
        if(account1.getCurrency_id().getId()!=account2.getCurrency_id().getId()){
            if(account1.getAmount()<total){//Check out of range or not
                return "You don't have enough money!!!";
            }
            if(account1.getAmount()>=total){//Check enough money or equal
                //If first account's currency is KZT
                if(account1.getCurrency_id().getId()==5){
                    //We need only divide total value to second sale_value minus percentage for transaction is 5%
                    return "You will send: "+(total/c2.getSale_value()-(total/c2.getSale_value()*0.05));
                }
                //If second account's currency is KZT
                if(account2.getCurrency_id().getId()==5){
                    //We need only multiply total value to second purchase_value minus percentage for transaction is 5%
                    return "You will send: "+(total*c1.getPurchase_value()-(total*c1.getPurchase_value()*0.05));
                }
                //If both accounts different and currencies also different and not KZT
                if(account1.getCurrency_id().getId()!=5&&account2.getCurrency_id().getId()!=5){
                    //We need change total value to KZT
                    double be = total*c1.getPurchase_value();
                    //After this KZT value change to second currency value with divide them to sale_value
                    double mid = be/c2.getSale_value();
                    //And minus percentage for transaction is 5%
                    double akwa = mid-(mid*0.05);
                    return "You will send: "+akwa;
                }
            }
        }
        return "";
    }


    //End AJAX requests functions------------------------------------------------------------------------------


    //Functional Exchange Debet Credit Transfer


    @RequestMapping(value = "/exchangeMoney", method = RequestMethod.POST)
    public String exchangeMoney(@RequestParam(name = "amount") Double amount,
                                @RequestParam(name = "currency") Long cid1,
                                @RequestParam(name = "currency2") Long cid2,
                                @RequestParam(name = "manId") String manId,
                                @RequestParam(name = "oId") Long oId){
        //Get balance certain currency from database
        Bank_Total_Balance b1 = userBean.getBalanceById(cid1);
        Bank_Total_Balance b2 = userBean.getBalanceById(cid2);
        //This for KZT
        Bank_Total_Balance b3 = userBean.getBalanceById(5L);



        //This part of code to take current time stamp and change to sql.Timestamp
        java.sql.Timestamp currentTimestamp = getTimeStamp();

        //Get certain currency_exchange from database
        Currency_Exchange c1 = userBean.getCurrencyById(cid1);
        Currency_Exchange c2 = userBean.getCurrencyById(cid2);

        if(cid1==6||cid1==7){//In database we don't have currency_exchange KZT
            c1=userBean.getCurrencyById(cid1-1);//Order in database without KZT
        }//In this case we need take the last two currency_exchange value by minus 1
        if(cid2==6||cid2==7){
            c2=userBean.getCurrencyById(cid2-1);
        }

        Currencies cc1 = userBean.getKZT(cid1);//We need take KZT from currencies
        Currencies cc2 = userBean.getKZT(cid2);
        Double ex = exchange(c1,c2, amount, cc1,cc2);//Call method exchange which do exchange for us

        Users manager = userBean.getUser(manId);//Get Manager who doing this operation
        Operations operation = new Operations(oId,"EXCHANGE");//Create 'EXCHANGE' operation

        //Create new object of transaction_histories
        Transaction_Histories history = new Transaction_Histories(null,manager,null,null,operation,cc2,ex,currentTimestamp);


        if(cid1==5){//If the first value is KZT
            double be = b3.getValue();//We need take total value of KZT from database
            b3.setValue(be+amount);//Set this total value plus amount value
            //We need also take total value the second currency and minus to changing value which KZT divide to 2 sale_value
            double af = b2.getValue()-(amount/c2.getSale_value());
            //Set them
            b2.setValue(af);
            //Update database
            userBean.update(b3);
            userBean.update(b2);
        }
        if(cid2==5){//If the second value is KZT
            double be = b1.getValue();//We need take total value of first currency from database
            b1.setValue(be+amount);//Set this total value plus amount value
            //We need also take total value the KZT and minus to changing value which 1 currency multiply to purchase_value
            double af = b3.getValue()-(amount*c1.getPurchase_value());
            //Set them
            b3.setValue(af);
            //Update database
            userBean.update(b1);
            userBean.update(b3);
        }
        if(cid1!=5&&cid2!=5){//If both them is not KZT
            double be = b1.getValue();//Get 1 total value from database
            b1.setValue(be+amount);//plus them with amount
            double income = amount*c1.getPurchase_value();//Changing value to KZT
            double mid=b2.getValue();//Get 2 total value from database
            b2.setValue(mid-(income/c2.getSale_value()));//minus them with changing to 2 currency by divide to sale_value
            //Update them
            userBean.update(b1);
            userBean.update(b2);
        }
        //Save new transaction_history
        userBean.save(history);
        return "redirect:managerTEPT";
    }

    @RequestMapping(value = "/debet", method = RequestMethod.POST)
    public String debet(@RequestParam(name = "amount") Double amount,
                        @RequestParam(name = "account") Long id,
                        @RequestParam(name = "manId") String manId,
                        @RequestParam(name = "oId") Long oId){
        //This method is DEBET it's like you put money to your account
        Accounts account = userBean.getAccountByID(id);//Get account from database

        if(account.isIs_blocked()){
            return "redirect:managerTEPT";
        }
        Users manager = userBean.getUser(manId);//Get manager from database who doing this transaction
        Operations operation = new Operations(oId,"DEBET");//Create new 'DEBET' operation


        java.sql.Timestamp currentTimestamp = getTimeStamp();//get current TimeStamp

        //Get total balance current currency
        Bank_Total_Balance b1 = userBean.getBalanceById(account.getCurrency_id().getId());
        //Take percentage for transaction it's 1%
        double percent = amount*0.01;
        //Set them into total balance
        double be = b1.getValue()+percent+amount;
        b1.setValue(be);
        //Add amount but minus percentage
        Double val = account.getAmount();
        account.setAmount(val+amount-percent);
        //Update them into database
        userBean.update(account);
        userBean.update(b1);
        //Create new transaction_history
        Transaction_Histories history = new Transaction_Histories(manager,account,account,operation,account.getCurrency_id(),amount-percent,currentTimestamp);
        userBean.save(history);
        return "redirect:managerTEPT";
    }

    @RequestMapping(value = "/credit", method = RequestMethod.POST)
    public String credit(@RequestParam(name = "amount") Double amount,
                         @RequestParam(name = "account") Long id,
                         @RequestParam(name = "manId") String manId,
                         @RequestParam(name = "oId") Long oId){
        //This method is CREDIT it's like you take your money from your account

        Accounts account = userBean.getAccountByID(id);//get current account from database
        if(account.isIs_blocked()){
            return "redirect:managerTEPT";
        }
        Users manager = userBean.getUser(manId);//Get manager from database who doing this transaction
        Operations operation = new Operations(oId,"CREDIT");//Create new 'CREDIT' operation


        java.sql.Timestamp currentTimestamp = getTimeStamp();//get current TimeStamp

        //Get total balance current currency
        Bank_Total_Balance b1 = userBean.getBalanceById(account.getCurrency_id().getId());
        //Take percentage for transaction it's 1%
        double percent = amount*0.01;
        double be = b1.getValue()+percent-amount;
        //Set them into total balance
        b1.setValue(be);
        userBean.update(b1);
        //Minus amount and minus percentage
        Double val = account.getAmount();
        account.setAmount(val-amount-percent);
        userBean.update(account);

        //Create new transaction_history
        Transaction_Histories history = new Transaction_Histories(manager,account,account,operation,account.getCurrency_id(),amount-percent,currentTimestamp);
        userBean.save(history);

        return "redirect:managerTEPT";
    }

    @RequestMapping(value = "/transfer", method = RequestMethod.POST)
    public String transfer(@RequestParam(name = "amount") Double amount,
                           @RequestParam(name = "account1") Long id1,
                           @RequestParam(name = "account2") Long id2,
                           @RequestParam(name = "manId") String manId,
                           @RequestParam(name = "oId") Long oId){


        //This is transfer money between accounts which have different type of currency account
        if(id1==id2){//If accounts are same nothing will be do
            return "redirect:managerTEPT";
        }
        Accounts account1 = userBean.getAccountByID(id1);//Get account by id from database
        Accounts account2 = userBean.getAccountByID(id2);

        if(account1.isIs_blocked()){
            return "redirect:managerTEPT";
        }
        if(account2.isIs_blocked()){
            return "redirect:managerTEPT";
        }

        //Get currency_exchange type from database
        Currency_Exchange c1 = userBean.getCurrencyById(account1.getCurrency_id().getId());
        Currency_Exchange c2 = userBean.getCurrencyById(account2.getCurrency_id().getId());

        Users manager = userBean.getUser(manId);//Get manager from database who doing this transaction
        Operations operation = new Operations(oId,"TRANSFER");//Create new 'TRANSFER' operation


        java.sql.Timestamp currentTimestamp = getTimeStamp();//Get current TimeStamp

        //Get total balance of certain currency
        Bank_Total_Balance b1 = userBean.getBalanceById(account1.getCurrency_id().getId());
        Bank_Total_Balance b2 = userBean.getBalanceById(account2.getCurrency_id().getId());

        //Minus amount from 1 account
        double v1 = account1.getAmount();
        account1.setAmount(v1-amount);
        userBean.update(account1);
        //Minus amount from 1 account currency total balance
        double b1_total = b1.getValue();
        b1.setValue(b1_total-amount);
        userBean.update(b1);

        //Variable akwa is end value
        double akwa = 0.0;
        //Variable percent for percentage
        double percent = 0.0;
        //If 1 account value is more than amount or equal
        if(account1.getAmount()>=amount){
            //If currencies are same
            if(account1.getCurrency_id().getId()==account2.getCurrency_id().getId()){
                //Take 5% for transaction
                akwa = amount - (amount*0.05);
                percent=amount*0.05;
            }
            //If 1 currency is KZT
            if(account1.getCurrency_id().getId()==5){
                //Changing to 2 currency by divide amount to sale_value minus percentage
                akwa=(amount/c2.getSale_value()-(amount/c2.getSale_value()*0.05));
                percent = amount/c2.getSale_value()*0.05;
            }
            //If 2 currency is KZT
            if(account2.getCurrency_id().getId()==5){
                //Changing 1 currency to KZT minus percentage
                akwa=(amount*c1.getPurchase_value()-(amount*c1.getPurchase_value()*0.05));
                percent = amount*c1.getPurchase_value()*0.05;
            }
            //If both them are not KZT and currencies are different
            if(account1.getCurrency_id().getId()!=5&&account2.getCurrency_id().getId()!=5){
                //Changing to KZT
                double be = amount*c1.getPurchase_value();
                //After this KZT change to 2 currency by divide to sale_value
                double mid = be/c2.getSale_value();
                //Minus percentage
                akwa = mid-(mid*0.05);
                percent = mid*0.05;
            }
        }
        //Save money into 2 account
        double dd = account2.getAmount();
        account2.setAmount(dd+akwa);
        userBean.update(account2);
        //Save total money plus amount and percentage
        double b22=b2.getValue();
        b2.setValue(b22+percent+akwa);
        userBean.update(b2);
        //Create new transaction_history
        Transaction_Histories history = new Transaction_Histories(manager,account1,account2,operation,account2.getCurrency_id(),akwa,currentTimestamp);
        userBean.save(history);

        return "redirect:managerTEPT";
    }

    public java.sql.Timestamp getTimeStamp(){
        Calendar calendar = Calendar.getInstance();
        java.util.Date now = calendar.getTime();
        java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
        return currentTimestamp;
    }
}
