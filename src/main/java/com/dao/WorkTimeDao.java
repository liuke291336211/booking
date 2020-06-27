package com.dao;

import com.Entity.WorkTime;

import java.util.List;

public interface WorkTimeDao {


    List<WorkTime> findByDoctorId(Integer id);

    void deleteByDoctorId(Integer id);
}
