package com.service;

import com.Entity.Illness;

import java.util.List;

public interface IIllnessService {

    List<Illness> findAll(Integer page, Integer size);

    void addIllness(String illnessname);

    void deleteById(Integer id);
}
