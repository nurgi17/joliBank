package com.firstspring.classes;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "users")
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "login")
    private String login;
    @Column(name = "password")
    private String password;
    @Column(name = "full_name")
    private String full_name;
    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Roles> roles;

    public Users() {
    }

    public Users(String login, String password, String full_name, Set<Roles> roles) {
        this.login = login;
        this.password = password;
        this.full_name = full_name;
        this.roles = roles;
    }


    public Users(Long id, String login, String password, String full_name, Set<Roles> roles) {
        this.id = id;
        this.login = login;
        this.password = password;
        this.full_name = full_name;
        this.roles = roles;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public Set<Roles> getRoles() {
        return roles;
    }

    public void setRoles(Set<Roles> roles) {
        this.roles = roles;
    }
}
