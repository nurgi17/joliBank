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
public class AdminController {
    @Autowired
    UserBean userBean;

    @RequestMapping(value = "/adminViewT", method = RequestMethod.GET)
    public ModelAndView adminViewTran(HttpSession session){
        ModelAndView mw = new ModelAndView("adminAdd");
        List<Transaction_Histories> allTransactions = userBean.getAllTransactions();// get AllTransactions_Histories
        mw.addObject("allTransactions", allTransactions);
        return mw;
    }


    @RequestMapping(value = "/adminChange", method = RequestMethod.GET)
    public ModelAndView adminChangePage(HttpSession session, Long id){
        ModelAndView mw = new ModelAndView("adminChange");
        List<Currency_Exchange> allCurrencies = userBean.getAllCurrencies();// get AllCurrencies
        mw.addObject("allCurrencies", allCurrencies);
        return mw;
    }

    @RequestMapping(value = "/adminViewB", method = RequestMethod.GET)
    public ModelAndView adminViewPage(HttpSession session){
        ModelAndView mw = new ModelAndView("adminView");
        List<Bank_Total_Balance> bank_total_balances = userBean.getAllBalance();// get AllBalance
        mw.addObject("allBalance", bank_total_balances);
        return mw;
    }


    //Admin functional methods POST-------------------------------------------------------------------------------------
    @RequestMapping(value = "/adminAddNewManager", method = RequestMethod.POST)
    public String adminAddNewManager(@RequestParam(name = "full_name") String full_name,
                                     @RequestParam(name = "login") String login,
                                     @RequestParam(name = "password") String password){
        // This method is add new Manager in database
        Set<Roles> role = new HashSet<Roles>();
        role.add(new Roles(2L,"ROLE_MANAGER"));//set ROLE_MANAGER
        Users manager = new Users(login,DigestUtils.shaHex(password),full_name, role);//change password to sha
        userBean.save(manager);// save them into database
        return "redirect:profile";
    }

    @RequestMapping(value = "/change2", method = RequestMethod.POST)
    public String change2(@RequestParam(name = "id") Long id,
                          @RequestParam(name = "purchase_value") Double pv,
                          @RequestParam(name = "sale_value") Double sv){

        //Change currency's value

        //This part of code to take current time stamp and change to sql.Timestamp
        java.sql.Timestamp currentTimestamp = getTimeStamp();

        //get current currency_exchange by id
        Currency_Exchange c1 = userBean.getCurrencyById(id);
        //Changing this object with set methods
        c1.setPurchase_value(pv);
        c1.setSale_value(sv);
        c1.setAssigned_time(currentTimestamp);
        //Updating them into databse
        userBean.update(c1);
        return "redirect:adminChange";
    }

    public java.sql.Timestamp getTimeStamp(){
        Calendar calendar = Calendar.getInstance();
        java.util.Date now = calendar.getTime();
        java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
        return currentTimestamp;
    }
}
