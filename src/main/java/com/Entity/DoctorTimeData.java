package com.Entity;

import java.util.HashMap;
import java.util.Set;

public class DoctorTimeData {
    private Doctor doctor;
    private HashMap<String, String> doctorTime;
    private Set<String> comment;

    @Override
    public String toString() {
        return "DoctorTimeData{" +
                "doctor=" + doctor +
                ", doctorTime=" + doctorTime +
                ", comment=" + comment +
                '}';
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public HashMap<String, String> getDoctorTime() {
        return doctorTime;
    }

    public void setDoctorTime(HashMap<String, String> doctorTime) {
        this.doctorTime = doctorTime;
    }

    public Set<String> getComment() {
        return comment;
    }

    public void setComment(Set<String> comment) {
        this.comment = comment;
    }
}
