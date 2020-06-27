package com.Entity;

import java.io.Serializable;

public class Admin implements Serializable {
    private Integer id;
    private String adname;
    private String phonenum;
    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdname() {
        return adname;
    }

    public void setAdname(String adname) {
        this.adname = adname;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", adname='" + adname + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
