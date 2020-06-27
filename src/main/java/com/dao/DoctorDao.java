package com.dao;

import com.Entity.Doctor;
import com.Entity.DoctorTimeData;
import com.Entity.Schedule;
import com.Entity.WorkTime;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DoctorDao {

    List<Doctor> findAll();

    //将doctor表的外键置为null
    void setOffice(Integer officeid);

    List<Doctor> findByNull();

    void updataOfficeid(@Param("officeid") Integer officeid,@Param("doctorid") Integer doctorid);

    void addDoctor(@Param("doctor") Doctor doctor);

    List<Schedule> findShedule();

    void addWorkTime(@Param("scheduleid") Integer sch,@Param("visitnum") Integer nums,@Param("doctorid") Integer dotcotId);

    void deleteDoctor(Integer id);

    List<Doctor> findOrder();

    Doctor findById(Integer doctorid);

    List<WorkTime> findSheduleByDoctorid(Integer doctorid);

    Doctor findByIdForOffice(Integer doctorid);
}
