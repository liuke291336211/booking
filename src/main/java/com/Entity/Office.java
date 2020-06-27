package com.Entity;

import java.util.List;

public class Office {
    private Integer id;
    private String officename;
    private List<Doctor> doctors;
    private List<Illness> illnesses;

    public List<Doctor> getDoctors() {
        return doctors;
    }

    public void setDoctors(List<Doctor> doctors) {
        this.doctors = doctors;
    }

    public List<Illness> getIllnesses() {
        return illnesses;
    }

    public void setIllnesses(List<Illness> illnesses) {
        this.illnesses = illnesses;
    }

    public String getOfficename() {
        return officename;
    }

    public void setOfficename(String officename) {
        this.officename = officename;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Office{" +
                "id=" + id +
                ", officename='" + officename + '\'' +
                '}';
    }
}
