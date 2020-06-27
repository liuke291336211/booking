package com.Entity;

import com.util.DateChange;

import java.util.Date;

public class Schedule {
    private Integer id;
    private String weekday;
    private Date worktime;
    private String worktimeStr;

    public String getWorktimeStr() {
        worktimeStr = DateChange.dateToString(worktime, "HH:mm:ss");
        return worktimeStr;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWeekday() {
        return weekday;
    }

    public void setWeekday(String weekday) {
        this.weekday = weekday;
    }

    public Date getWorktime() {
        return worktime;
    }

    public void setWorktime(Date worktime) {
        this.worktime = worktime;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "id=" + id +
                ", weekday='" + weekday + '\'' +
                ", worktime=" + worktime +
                '}';
    }
}
