package com.Entity;

import java.io.Serializable;
import java.util.List;

public class Doctor implements Serializable {
    private Integer id;
    private String doctorname;
    private String phonenum;
    private String academictitle;
    private String sex;
    private Integer age;
    private String  description;
    private Office  office;
    private String visittimeStr = "未安排就诊时段";
    private List<Order> orders;

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public String getVisittimeStr() {
        return visittimeStr;
    }

    public void setVisittimeStr(String visittimeStr) {
        this.visittimeStr = visittimeStr;
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDoctorname() {
        return doctorname;
    }

    public void setDoctorname(String doctorname) {
        this.doctorname = doctorname;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getAcademictitle() {
        return academictitle;
    }

    public void setAcademictitle(String academictitle) {
        this.academictitle = academictitle;
    }

    @Override
    public String toString() {
        return "Doctor{" +
                "id=" + id +
                ", doctorname='" + doctorname + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", academictitle='" + academictitle + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", description='" + description + '\'' +
                ", office=" + office +
                '}';
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
