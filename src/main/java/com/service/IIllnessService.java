package com.service;

import com.Entity.Illness;
import com.Entity.Office;

import java.util.List;

public interface IIllnessService {

    List<Illness> findAll(Integer page, Integer size);
    List<Illness> findAll();

    void addIllness(String illnessname);

    void deleteById(Integer id);

    String findIllnessname(Integer id);
}
