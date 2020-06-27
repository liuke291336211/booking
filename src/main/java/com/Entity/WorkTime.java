package com.Entity;

import java.util.List;

public class WorkTime {
    private Integer id;
    private Integer doctorid;
    private Integer scheduleid;
    private Integer visitnum;
    private Integer ordernum;
    private List<Schedule> scheduleList;

    public Integer getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(Integer ordernum) {
        this.ordernum = ordernum;
    }

    public List<Schedule> getScheduleList() {
        return scheduleList;
    }

    public void setScheduleList(List<Schedule> scheduleList) {
        this.scheduleList = scheduleList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(Integer doctorid) {
        this.doctorid = doctorid;
    }

    public Integer getScheduleid() {
        return scheduleid;
    }

    public void setScheduleid(Integer scheduleid) {
        this.scheduleid = scheduleid;
    }

    public Integer getVisitnum() {
        return visitnum;
    }

    public void setVisitnum(Integer visitnum) {
        this.visitnum = visitnum;
    }

    @Override
    public String toString() {
        return "WorkTime{" +
                "id=" + id +
                ", doctorid=" + doctorid +
                ", scheduleid=" + scheduleid +
                ", visitnum=" + visitnum +
                '}';
    }
}
