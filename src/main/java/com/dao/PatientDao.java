package com.dao;

import com.Entity.Order;
import com.Entity.Patient;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PatientDao {


    Patient findByPhone(String phonenum);

    List<Order> findOrderAllById(Integer patientId);

    void addPatient(@Param("patient") Patient patient);

    void updataPassword(@Param("phonenum") String phonenum, @Param("password") String password);
}
