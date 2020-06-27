package com.service;

import com.Entity.Doctor;
import com.Entity.Illness;
import com.Entity.Office;

import java.util.List;

public interface IOfficeService {

    List<Office> findAll(Integer page, Integer size);

    void addOffice(String officename);

    List<Doctor> findByOfficeid(Integer id);

    Office findById(Integer id);

    List<Illness> findByOfficeidForIllness(Integer id);

    void deleteOffice(Integer id);

    List<Office> findAll();

    Office findByIdOnDoctor(Integer officeid);
}
