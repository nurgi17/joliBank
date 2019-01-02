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
public class ManagerController {
    @Autowired
    UserBean userBean;

    //Manager pages------------------------------------------------------
    @RequestMapping(value = "/managerAdd", method = RequestMethod.GET)
    public ModelAndView managerAdd(HttpSession session){
        ModelAndView mw = new ModelAndView("managerAdd");
        List<Accounts> accounts = userBean.getAllAccounts();//get AllAccounts
        mw.addObject("allAccounts", accounts);
        return mw;
    }

    @RequestMapping(value = "/managerTEPT", method = RequestMethod.GET)
    public ModelAndView managerTEPT(HttpSession session){
        ModelAndView mw = new ModelAndView("managerTEPT");
        List<Accounts> accounts = userBean.getAllAccounts();//get AllAccounts
        mw.addObject("allAccounts", accounts);
        return mw;
    }

    @RequestMapping(value = "/managerView", method = RequestMethod.GET)
    public ModelAndView managerView(HttpSession session){
        ModelAndView mw = new ModelAndView("managerView");
        Users manager = (Users)session.getAttribute("manager");
        List<Transaction_Histories> histories = userBean.getTransactionByid(manager.getId());
        mw.addObject("myTransactions", histories);
        return mw;
    }

    //Manager functional methods POST-----------------------------------
    @RequestMapping(value = "/managerUpdate", method = RequestMethod.GET)
    public ModelAndView managerUpdate(@RequestParam(name = "id") Long id){
        //Updating Account
        ModelAndView mw = new ModelAndView("managerUpdate");
        Accounts account = userBean.getAccountByID(id);
        mw.addObject("account", account);
        return mw;
    }

    @RequestMapping(value = "/addNewAcc", method = RequestMethod.POST)
    public String addNewAcc(@RequestParam(name = "amount") Double amount,
                            @RequestParam(name = "birth_date") Date birth_date,
                            @RequestParam(name = "currency") Long currency,
                            @RequestParam(name = "first_name") String first_name,
                            @RequestParam(name = "last_name") String last_name,
                            @RequestParam(name = "iin_number") String iin_number){
        //Add new account
        Currencies currenciesList = userBean.getKZT(currency);//get current currency

        Bank_Total_Balance b = userBean.getBalanceById(currenciesList.getId());//get total balance certain currency
        double b_total = b.getValue();//add amount in total balance
        b.setValue(b_total+amount);
        userBean.update(b);

        java.util.Date date = new java.util.Date();//get current Date Time
        java.sql.Date date1 = new java.sql.Date(date.getTime());

        String IBAN = getIBAN(currenciesList.getId());//Get first 7 numeric digits by currency
        long number = (long) Math.floor(Math.random() * 9000000000000L) + 1000000000000L;//generating 13 digits
        IBAN+=number;
        //Creating new Account
        Accounts account = new Accounts(IBAN, first_name, last_name, birth_date, iin_number, currenciesList,amount,date1,false);
        userBean.save(account);
        return "redirect:managerAdd";
    }


    @RequestMapping(value = "/mEdit", method = RequestMethod.POST)
    public String mEdit(@RequestParam(name = "id") Long id){
        return "redirect:managerUpdate?id="+id;
    }

    @RequestMapping(value = "/updateAcc", method = RequestMethod.POST)
    public String updateAcc(@RequestParam(name = "amount") Double amount,
                            @RequestParam(name = "birth_date") Date birth_date,
                            @RequestParam(name = "currency") Long currency,
                            @RequestParam(name = "first_name") String first_name,
                            @RequestParam(name = "last_name") String last_name,
                            @RequestParam(name = "iin_number") String iin_number,
                            @RequestParam(name = "id") Long id){
        //Updating and Changing account values
        Accounts account = userBean.getAccountByID(id);
        account.setAmount(amount);
        account.setBirth_date(birth_date);
        Currencies currency1 = userBean.getKZT(currency);
        account.setCurrency_id(currency1);
        account.setFirst_name(first_name);
        account.setLast_name(last_name);
        account.setIin_number(iin_number);
        userBean.update(account);
        return "redirect:managerAdd";
    }

    public String getIBAN(Long id){//
        String[] iban = {"RU00777","EU00777","GB00777","US00777","KZ00777","KG00777","CN00777"};
        for(int i=0;i<iban.length;i++){
            if(id-1==i){
                return iban[i];
            }
        }
        return "";
    }
}
