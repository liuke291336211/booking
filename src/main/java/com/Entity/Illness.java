package com.Entity;

import java.io.Serializable;

public class Illness implements Serializable {
    private Integer id;
    private String illnessname;

    public String getIllnessname() {
        return illnessname;
    }

    public void setIllnessname(String illnessname) {
        this.illnessname = illnessname;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Illness{" +
                "id=" + id +
                ", illnessname='" + illnessname + '\'' +
                '}';
    }
}
