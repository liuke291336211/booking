package com.Entity;

public class OfficeRelation {
    private Integer id;
    private Integer officeid;
    private Integer illnessid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOfficeid() {
        return officeid;
    }

    public void setOfficeid(Integer officeid) {
        this.officeid = officeid;
    }

    public Integer getIllnessid() {
        return illnessid;
    }

    public void setIllnessid(Integer illnessid) {
        this.illnessid = illnessid;
    }

    @Override
    public String toString() {
        return "OfficeRelation{" +
                "id=" + id +
                ", officeid=" + officeid +
                ", illnessid=" + illnessid +
                '}';
    }
}
