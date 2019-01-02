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
public class HomeController {
    @Autowired
    UserBean userBean;
    //Login page-------------------------------------------------------
    @RequestMapping(value = {"index", "/","home"}, method = RequestMethod.GET)
    public ModelAndView indexPage(){
        //Main index page where you need to log in
        ModelAndView mw = new ModelAndView("index");
        return mw;
    }

    // Profile page-----------------------------------------------------
    @RequestMapping (value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile(HttpSession session){
        //this page to check which role your account has
        ModelAndView mw = new ModelAndView("manager");
        Users user = getUserData();
        Set<Roles> s = user.getRoles();
        boolean isAdmin = false;
        for(Roles r: s){
            if(r.getId()==1){
                isAdmin = true;
                break;
            }
        }
        //Checking Admin or manager
        if(isAdmin){
            mw.addObject("admin",user);
            session.setAttribute("admin",user);
            List<Users> allManagers = userBean.getAllManagers();
            mw.addObject("allManagers", allManagers);
            mw.setViewName("admin");
            return mw;
        }else{
            mw.addObject("manager", user);
            session.setAttribute("manager",user);
            return mw;
        }
    }

    //403 Access forbidden page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView ACCESS_FORBIDDEN_403(){
        ModelAndView mw = new ModelAndView("403");
        return mw;
    }
    //Security getData------------------------------------------------------------------------
    public Users getUserData(){
        Users user = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); if(!(authentication instanceof AnonymousAuthenticationToken)){
            UserDetails ud = (UserDetails) authentication.getPrincipal();
            user = userBean.getUser(ud.getUsername());
        }
        return user;
    }

    //END-------------------------------------------------------------------------------------
}
