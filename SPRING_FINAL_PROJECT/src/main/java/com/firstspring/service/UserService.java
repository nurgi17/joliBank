package com.firstspring.service;

import com.firstspring.beans.UserBean;
import com.firstspring.classes.Roles;
import com.firstspring.classes.Users;
import org.springframework.security.core.authority.SimpleGrantedAuthority; import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import java.util.HashSet; import java.util.Set;
public class UserService implements UserDetailsService {
    private UserBean userBean;
    public UserBean getUserBean() { return userBean;
    }
    public void setUserBean(UserBean userBean) { this.userBean = userBean;
    }

    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Users myUser = userBean.getUser(s);
        Set<Roles> roles = myUser.getRoles();
        Set<SimpleGrantedAuthority> authorities = new HashSet<SimpleGrantedAuthority>();
        for(Roles r : roles){
            authorities.add(new SimpleGrantedAuthority(r.getName()));
        }
        User securityUser = new User(myUser.getLogin(), myUser.getPassword(), authorities);
        return securityUser;
    }
}
