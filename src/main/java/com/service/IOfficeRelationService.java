package com.service;


import com.Entity.Office;

import java.util.List;

public interface IOfficeRelationService {


    void addOfficeId(Integer officeid, Integer[] illnessids);

    List<Office> findOfficeByIllnessId(Integer id);
}
