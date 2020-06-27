package com.dao;

import com.Entity.Doctor;
import com.Entity.Illness;
import com.Entity.Office;

import java.util.List;

public interface OfficeDao {

    List<Office> findAllOffice();

    void addOffice(String officename);

    List<Doctor> findByOfficeid(Integer id);

    Office findById(Integer id);

    List<Illness> findByOfficeidForIllness(Integer id);

    void deleteOffice(Integer id);

    Office findDoctorOnOffice(Integer officeid);
}
