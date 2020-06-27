package com.service;

import com.Entity.Doctor;
import com.Entity.DoctorTimeData;
import com.Entity.Schedule;
import com.Entity.WorkTime;

import java.util.HashMap;
import java.util.List;

public interface IDoctorService {

    List<Doctor> findAll(Integer page, Integer size);

    List<Doctor> findByNull();

    void addOfficeId(Integer officeid, Integer[] doctorids);

    void addDoctor(Doctor doctor);

    List<Schedule> findShedule();


    void addWorkTime(Integer[] scheduleIds, Integer nums, Integer doctorId);

    void deleteDoctor(Integer id);

   HashMap<Doctor, Integer> CommnetCount();

    Doctor findDoctorById(Integer doctorid);

    List<WorkTime> findSheduleByDoctorid(Integer doctorid);

    Doctor findOfficeForDoctor(Integer doctorid);
}
