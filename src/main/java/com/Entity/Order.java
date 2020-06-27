package com.Entity;

import com.util.DateChange;

import java.util.Date;

public class Order {
    private Integer id;
    private Date ordertime;
    private Date starttime;
    private String starttimeStr;
    private Integer degree;
    private Integer status;
    private String comment;
    private Integer patientid;
    private Integer doctorid;
    private Doctor doctor;
    private Patient patient;

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getStarttimeStr(){
        starttimeStr = DateChange.dateToString(starttime, "yyyy-MM-DD HH:mm:ss");
        return starttimeStr;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Integer getDegree() {
        return degree;
    }

    public void setDegree(Integer degree) {
        this.degree = degree;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getPatientid() {
        return patientid;
    }

    public void setPatientid(Integer patientid) {
        this.patientid = patientid;
    }

    public Integer getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(Integer doctorid) {
        this.doctorid = doctorid;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", ordertime=" + ordertime +
                ", starttime=" + starttime +
                ", degree=" + degree +
                ", status=" + status +
                ", comment='" + comment + '\'' +
                ", patientid=" + patientid +
                ", doctorid=" + doctorid +
                '}';
    }
}
